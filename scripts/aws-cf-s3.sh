#!/bin/bash

echo "Creating S3 Bucket via CF Stack"
STACK_ID="$(aws cloudformation create-stack --stack-name s3bucket --template-body file://S3/S3_Create_Bucket.yaml --region 'ap-south-1')"
while true; do
  echo "Checking stack creation for $STACK_ID, please wait."
  STACK_STATUS="$(aws cloudformation describe-stacks --query 'Stacks[?StackId==`'"$STACK_ID"'`].StackStatus')"
  if [ "$STACK_STATUS" == "CREATE_COMPLETE" ] || [ "$STACK_STATUS" == "UPDATE_COMPLETE" ]; then
    echo "Stack Complete"
	  exit 0
  elif [ "$STACK_STATUS" == *"ROLL"* ]; then
	  echo "Stack Rolled back"
    exit 1
	elif [ "$STACK_STATUS" == *"DELETE"* ]; then
    echo "Stack Deleted"
	  exit 1    
  fi
	sleep 10
done
  
