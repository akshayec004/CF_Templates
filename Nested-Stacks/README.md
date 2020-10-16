# Cloud Formation Nested Templates

Launch_Configuration.json - This is a CF template for creating Launch Configuration

Auto_Scaling_Group.json - This is a CF template for creating Autoscaling group. Takes output of the template Launch_Configuration.json as an input.

Compute_Stack.json - This is a nested stack to create LC and ASG
                     Parameters :
                     i). BucketName - S3 Bucket name where the CF templates are stored.
                     ii). BucketPath - Path inside the bucket where the templates are stored.

Steps to run a nested template :
1. Create an S3 bucket (Ex: cf-templates-xyz)
2. Create a folder (Ex: nested-templates) and upload the files - Launch_Configuration.json and Auto_Scaling_Group.json
3. Create a stack in CF by uploading the template Compute_Stack.json
