#!/bin/bash
echo "Enter a bucket name"
read BUCKET
aws s3 mb s3://$BUCKET
if  aws s3 ls | grep -q "$BUCKET" ; then
    echo "Your bucket has been created!"
    echo "What is the path to the file you'd like to upload?"
    read FILE
    aws s3 cp $FILE s3://$BUCKET
    aws s3 ls s3://$BUCKET
    aws s3 rb s3://$BUCKET --force
else
    echo "Your bucket has not been created. Use a unique name."
fi