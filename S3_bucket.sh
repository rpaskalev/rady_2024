#!/bin/bash

# Replace these placeholders with your actual values
AWS_REGION="us-east-1"
BUCKET_NAME="devops_bucket"
FILE_PATH="path/to/your/file"
S3_KEY="desired-key-in-bucket"
NEW_S3_KEY="new-desired-key"

# Create the S3 bucket
aws s3api create-bucket --bucket $BUCKET_NAME --region $AWS_REGION

# Check if the bucket creation was successful
if [ $? -eq 0 ]; then
    echo "S3 bucket '$BUCKET_NAME' created successfully."
else
    echo "Error creating S3 bucket."
fi

# Upload the file to S3 bucket
aws s3 cp $FILE_PATH s3://$BUCKET_NAME/$S3_KEY --region $AWS_REGION

# Rename the file in S3 bucket
aws s3 mv s3://$BUCKET_NAME/$S3_KEY s3://$BUCKET_NAME/$NEW_S3_KEY --region $AWS_REGION

# Delete the S3 bucket
aws s3 rb s3://$BUCKET_NAME --force --region $AWS_REGION
