import boto3
import json
import datetime
from decimal import Decimal

class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, Decimal):
            return int(obj) if obj % 1 == 0 else float(obj)
        return super(DecimalEncoder, self).default(obj)

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('ResumeVisitCounter')
s3 = boto3.client('s3')

def lambda_handler(event, context):
    # Increment visit count in DynamoDB
    response = table.update_item(
        Key={'PageName': 'HomePage'},
        UpdateExpression='SET VisitCount = if_not_exists(VisitCount, :init) + :inc',
        ExpressionAttributeValues={
            ':inc': 1,
            ':init': 0
        },
        ReturnValues='UPDATED_NEW'
    )

    # Extract the updated visit count
    count = response['Attributes']['VisitCount']

    # Extract additional information from the event object
    visitor_ip = event['requestContext']['identity']['sourceIp']
    user_agent = event['headers'].get('User-Agent', 'Unknown')

    # Log the visit timestamp to S3
    timestamp = datetime.datetime.utcnow().isoformat()
    
    log_entry = f"Visit at {timestamp}, IP: {visitor_ip}, User Agent: {user_agent}\n"
    
    # Define a unique key for the log file in the S3 bucket
    log_key = f"visitor_logs/{datetime.datetime.utcnow().strftime('%Y-%m-%d-%H%M%S')}_visit_log.txt"
   
    # Write the log entry to the S3 bucket
    s3.put_object(Bucket='salvagg-visitor-logs', Key=log_key, Body=log_entry)

    # Prepare and return the response
    response_data = {
        'message': 'Function executed successfully!',
        'count': count
    }

    return {
        'statusCode': 200,
        'body': json.dumps(response_data, cls=DecimalEncoder),
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'OPTIONS,POST'
        }
    }