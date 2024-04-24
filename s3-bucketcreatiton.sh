#!/bin/bash


#Replace these placeholders with your actual values

AWS_REGION="us-east-1"
BUCKET_NAME="mys3bucket"

# Create the s3 bucket
aws s3api create-bucket --bucket $BUCKET_NAME --region $AWS_REGION

#CHECK IF THE BUCKET CREATION WAS SUCCESSFUL

if [ $? -eq 0 ] then
	echo "s3 bucket '$BUCKET_NAME' created successfully."
else
	echo "Error creating s3 bucket."
fi

#upload the file to s3
aws s3 cp $FILE_PATH s3://$BUCKET_NAME/$S3_KEY --region $AWS_REGION

cp $FILE_PATH s3://$BUCKET_NAME/$S3_KEY --region $AWS_REGION

NEW_S3_KEY="new-desired-key"
# Rename the file in S3 bucket

aws s3 mv s3://$BUCKET_NAME/$S3_KEY s3://$BUCKET_NAME/$NEW_S3_KEY --region $AWS_REGION

# Delete the S3 bucket
aws s3 rb s3://$BUCKET_NAME --force --region $AWS_REGION
