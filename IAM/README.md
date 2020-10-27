# Cross-Account Access with IAM Roles

Consider two AWS accounts - prod and dev. To allow IAM user (Ex:developer) in the dev account to have read/write permissions for a specific bucket in the prod account, follow below steps.
* Login to the prod account, create a policy 'read-write-prod-bucket' in IAM with read/write permissions for the specific bucket in the prod account
* Create a role in the prod account with 'Another AWS account' as a type of trusted entity. Enter the dev account ID and attach a policy read-write-prod-bucket created in the step 1.
* Login to the dev account, create a policy 'allow-assume-role-in-prod' with permission to assume the role created in the step 2.
* Create an IAM user 'developer' and attach the policy created in the step 3. 
* Login to dev account with the user 'developer' and switch role by entering the prod account ID and role ARN.
* Go to S3 and try to list/read/write objects in the bucket that you have permission to. If everything is setup correctly, we should be able to perform these operations.
