# CloudFormation Templates for launching VPC and its components
VPC Components - VPC, Subnets, InternetGateway, GatewayAttachment, RouteTable, Route Creation, SubnetRouteTableAssociation

VPC_1_Pri_1_Pub_Subnets.json - CF Template to create a VPC with one public and one private subnets. No parameters.

VPC_1_Subnet.json - CF template to create a VPC and a subnet(private) in AZ. Parameters - Cidr block, Subnet range and AZ.

VPC_2_Pri_2_Pub_Subnets.json - CF Template to create a VPC with 2 public and 2 private subnets. No parameters. Similar to VPC_1_Pri_1_Pub_Subnets.json

VPC_2_PriSub_MySQL_RDS.json - CF template to create a VPC with 2 subnets, MySQL RDS Instance, DB Subnet Group and RDS Secuirty Group. Parameters - DB Username and Password.

VPC_Pri_Pub_Subnets_NAT.json - CF Template to create a VPC and a private and public subnets. Private subnet has internet access via NAT gateway. Parameters - VPC Cidr block, Pubic Subnet Cidr, Private Subnet Cidr, Public AZ and Private AZ.

Template_Config.json - Template configuration file for CF templates. Contains parameters, tags and stack plcy for the CF stack

# To integrate Cloudformation templates with CodeCommit/Github and CodePipeline
1. Create a AWS CloudFormation server role with permission to PowerUser policy in IAM.
2. Store your CloudFormation templates in SCM - Github or CodeCommit along with template configuration file which stores the parameters, Tags and Stack policy details for the CF stack. 
3. Go to CodePipeline and select Create New Pipeline
4. Enter name and create a new service role for CodePipeline if it doesn't exist or select the existing role
5. Select Source Provider as CodeCommit or Github
6. Enter the repository and branch details
7. Skip the build stage
8. In the deploy stage, select Deploy provider as 'AWS CloudFormation' and Action mode as 'Create or update Stack'
9. Enter a stack name and provide the template and template configuration(optional) files path. Select the role created in the step 1
10. Click next and review the parameter. Create the pipeline. The pipeline gets triggered immediately and create the CF stack.
