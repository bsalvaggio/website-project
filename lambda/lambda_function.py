import boto3
import json
import datetime
from decimal import Decimal

# Custom JSON encoder to handle Decimal objects from DynamoDB, as json.dumps() does not support Decimal by default
class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return int(obj) if obj % 1 == 0 else float(obj)
        return super(DecimalEncoder, self).default(obj)

# Initialize the DynamoDB resource and specify table name
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ResumeVisitCounter')

# Initialize the S3 client to interact with the S3 service
s3 = boto3.client('s3')

# Lambda function handler
def lambda_handler(event, context):
    # Update the specified item in DynamoDB table, incrementing the VisitCount attribute
    response = table.update_item(
        Key={'PageName': 'HomePage'}, 
        UpdateExpression='SET VisitCount = if_not_exists(VisitCount, :init) + :inc',  # Increment VisitCount
        ExpressionAttributeValues={
            ':inc': 1,  # Increment by 1
            ':init': 0  # Initialize at 0 if it doesn't exist
        },
        ReturnValues='UPDATED_NEW'  # Return the new value of VisitCount after the update
    )

    # Extract the updated visit count from the response
    count = response['Attributes']['VisitCount']

    # Prepare the response data to send back to the client
    response_data = {
        'message': 'Function executed successfully!',
        'count': count
    }

    # Log data preparation: Include the timestamp, visitor's IP address, page name, and new count
    log_data = {
        'timestamp': datetime.datetime.utcnow().isoformat(),  # Get the current UTC time in ISO format
        'visitor_ip': event['requestContext']['identity']['sourceIp'],  # Extract visitor's IP address from the event
        'page': 'HomePage',  # Indicate which page was visited
        'new_count': count  # Include the new visit count
    }

    # Convert the log data dictionary to a JSON string
    log_data_json = json.dumps(log_data)

    # Generate a unique file name for the log entry in S3 using the current time and Lambda request ID
    log_file_name = f"visitor_logs/{datetime.datetime.utcnow().strftime('%Y/%m/%d/%H%M%S')}_{context.aws_request_id}.json"

    # Use a try-except block to handle potential errors when writing to S3
    try:
        # Write the log data JSON string to the specified S3 bucket with the generated file name
        s3.put_object(Bucket='salvagg-visitor-logs', Key=log_file_name, Body=log_data_json)
    except Exception as e:
        # Print the error message to CloudWatch Logs if the S3 write operation fails
        print(f"Error writing to S3: {e}")

    # Return the response data in JSON format
    return {
        'statusCode': 200,
        'body': json.dumps(response_data, cls=DecimalEncoder),
        'headers': {
            'Access-Control-Allow-Origin': '*',  # Allow requests from any domain
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'OPTIONS,POST'  # Allow OPTIONS and POST HTTP methods
        }
    }
