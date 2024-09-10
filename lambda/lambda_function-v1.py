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

    response_data = {
        'message': 'Function executed successfully!',
        'count': count
    }

    return {
        'statusCode': 200,
        'body': json.dumps(response_data, cls=DecimalEncoder),  # Use the custom encoder here
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'OPTIONS,POST'
        }
    }