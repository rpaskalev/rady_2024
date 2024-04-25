#!/bin/bash
 
#variables
	AWS_REGION="us-east-1"
	BUCKET_NAME="ferdows-bucket"
	FILE_TO_UPLOAD="/Users/Ferdows/Desktop/aws_cli/fer.txt"
	NEW_FILE_NAME="changed-file-name.txt"
 
#s3 bucket creation 
	aws s3 mb s3://$BUCKET_NAME --region $AWS_REGION
 
	aws s3 cp $FILE_TO_UPLOAD s3://$BUCKET_NAME/
 
	aws s3 mv s3://$BUCKET_NAME/$(basename $FILE_TO_UPLOAD) s3://$BUCKET_NAME/$NEW_FILE_NAME
 
	aws s3 rb s3://$BUCKET_NAME --force

echo "bucket creation/deletion was successful."
