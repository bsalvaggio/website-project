import boto3
import json
from decimal import Decimal

# Create a custom JSON encoder
class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return int(obj) if obj % 1 == 0 else float(obj)
        return super(DecimalEncoder, self).default(obj)

# Initialize DynamoDB resource
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ResumeVisitCounter')
s3 = boto3.client('s3')  # Add S3 client initialization to allow Lambda to interact with S3

def lambda_handler(event, context):
    response = table.update_item(
        Key={'PageName': 'HomePage'},
        UpdateExpression='SET VisitCount = if_not_exists(VisitCount, :init) + :inc',
        ExpressionAttributeValues={
            ':inc': 1,
            ':init': 0
        },
        ReturnValues='UPDATED_NEW'
    )

    count = response['Attributes']['VisitCount']

    # Prepare response data
    response_data = {
        'message': 'Function executed successfully!',
        'count': count
    }

    # Generate log data (tiestamp, IP, page, and new count value)
    log_data = {
        'timestamp': datetime.utcnow().isoformat(),
        'visitor_ip': event['requestContext']['identity']['sourceIp'], # Extract the visitor's IP
        'page': 'HomePage',
        'new_count': count
    }

    # Convert log data to JSON string
    log_data_json = json.dumps(log_data)

    response_data = {
        'message': 'Function executed successfully!',
        'count': count
    }

    # Convert log data to JSON string
    log_data_json = json.dumps(log_data)

    # Generate a unique name for the log file based on the current time and the Lambda request ID
    log_file_name = f"visitor_logs/{datetime.utcnow().strftime('%Y/%m/%d/%H%M%S')}_{context.aws_request_id}.json"

    # Write the log data to an S3 bucket
    s3.put_object(Bucket='salvagg-visitor-logs', Key=log_file_name, Body=log_data_json)

    return {
        'statusCode': 200,
        'body': json.dumps(response_data, cls=DecimalEncoder),  # Use the custom encoder here
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'OPTIONS,POST'
        }
    }
