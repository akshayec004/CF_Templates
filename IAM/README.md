# Cross-Account Access with IAM Roles

Consider two AWS accounts - prod and dev. To allow IAM user (Ex:developer) in the dev account to have read/write permissions for a specific bucket in the prod account, follow below steps.
* Login to the prod account, create a policy 'read-write-prod-bucket' in IAM with read/write permissions for the specific bucket in the prod account. Attach the policy read-write-prod-bucket.json
* Create a role in the prod account with 'Another AWS account' as a type of trusted entity. Enter the dev account ID and attach a policy read-write-prod-bucket created in the step 1.
* Login to the dev account, create a policy 'allow-assume-role-in-prod' with permission to assume the role created in the step 2. Attach the policy allow-assume-role-in-prod.json
* Create an IAM user 'developer' and attach the policy created in the step 3. 
* Login to dev account with the user 'developer' and switch role by entering the prod account ID and role ARN.
* Go to S3 and try to list buckets or read/write objects in the bucket that you have permission to. If everything is setup correctly, we should be able to perform these operations.

## To restrict IAM roles to be assumed by a particular user (Ex : xyz) in dev account, follow the below steps :
* Create a policy using the file read-write-prod-bucket.json in prod account.
* Create a role in the prod account with 'Another AWS account' as a type of trusted entity. Enter the dev account ID and attach a policy read-write-prod-bucket created in the step.
* Go to the Trusted relationships tab in the role and click on edit trust relationship. In the JSON policy, add the ARN of the IAM user from the dev account ( xyz in this example) in the principal element and save the changes.
* Login to the dev account, create a policy 'allow-assume-role-in-prod' with permission to assume the role created in the step 2. Attach the policy allow-assume-role-in-prod.json
* Login the dev account with the user xyz and switch role by entering the prod account ID and role ARN. Only the user xyz should be able to assume the role created in the prod account. Other users can't assume this role.
