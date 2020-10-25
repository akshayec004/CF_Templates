# CloudFormation Nested Templates
Load_Balancer.yaml - This is a CF template for creating application load balancer. Input parameters - EnvironmentName, VPC, Subnets, SecurityGroup

Launch_Configuration.json - This is a CF template for creating Launch Configuration

Auto_Scaling_Group.json - This is a CF template for creating Autoscaling group. Inputs - LCNameParam (From Launch_Configuration.json) and TargetGroupParam (From Load_Balancer.yaml)

Compute_Stack.json - This is a nested stack to create LC, ALB and ASG
                     
Parameters :
i). BucketName - S3 Bucket name where the CF templates are stored.
ii). BucketPath - Path inside the bucket where the templates are stored.
iii). EnvironmentName - Dev
iv). VPC 
v). Subnets
vi). SecurityGroups

Steps to run a nested template :
1. Create an S3 bucket (Ex: cf-templates-xyz)
2. Create a folder (Ex: nested-templates) and upload the files - Launch_Configuration.json, Load_Balancer.yaml and Auto_Scaling_Group.json
3. Create a stack in CF by uploading the template Compute_Stack.json

Challenges Faced :

In a nested stack, we can't pass List of values parameter (Ex : Subnets, Security Groups) from parent to child stacks. Resolution for this is to define a parameter of type CommaDelimitedList in the child stack and type list in the parent stack. Then, use the intrinsic function Fn::Join to convert the list into combined string in the resource section of the parent stack.

Reference : https://aws.amazon.com/premiumsupport/knowledge-center/cloudformation-parameters-nested-stacks/
