# CloudFormation Templates
AWS CloudFormation Templates related to VPC, EC2, Load Balancers, S3
VPC - VPC, Subnets, InternetGateway, GatewayAttachment, RouteTable, Route Creation, SubnetRouteTableAssociation

## To integrate Cloudformation templates with CodeCommit/Github and CodePipeline
* Create a AWS CloudFormation service role with permission to PowerUser policy in IAM. This role is to be assumed by the Cloudformation. Policy depends on the resources to be created in the CF templates.
* Store your CloudFormation templates in SCM - Github or CodeCommit along with template configuration file which stores the parameters, Tags and Stack policy details for the CF stack. 
* Go to CodePipeline and select Create New Pipeline
* Enter name and create a new service role for CodePipeline if it doesn't exist or select the existing role
* Select Source Provider as CodeCommit or Github
* Enter the repository and branch details
* Skip the build stage
* In the deploy stage, select Deploy provider as 'AWS CloudFormation' and Action mode as 'Create or update Stack'
* Enter a stack name and provide the template and template configuration(optional) files path. Select the role created in the step 1
* Click next and review the parameter. Create the pipeline. The pipeline gets triggered immediately and create the CF stack.

## To run AWS Cloudformation templates from Jenkins :
* Install jenkins-cloudformation-plugin in the jenkins instance
* Create an EC2 instance profile/IAM user with full access permission to Cloudformation and resource to be created (Ex : S3 full access)
* Attach the instance profile created in the above step to EC2 instance where job would be executed. or Note down the access key ID and secret key of the IAM user created
* Create a jenkins job and configure Github repository and cloudformation settings in the build environment. Add the access and secret keys.
* Build the job and go to AWS CloudFormation console and check if the stack is created or not.
* Create a pipeline job with the AWS CLI command - 
aws cloudformation create-stack --stack-name <stack-name> --template-body file://<CF-Template-File> --region <AWS Region>
