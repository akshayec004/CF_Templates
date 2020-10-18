# Cloud Formation Templates For Launching EC2 Instances
EC2_Instance.json - CF tempate to create EC2 instance with Amazon Linux Operating System, Input parameters are EC2 Key Value pair, Instance Type, SSH Location

EC2_Env.yml - CloudFormation template to create an EC2 instance. Parameters are Environment, InstanceType, Subnet, SecurityGroups and KeyValuePair with condition for Environment parameter.

EC2_Userdata.yml - CF template to launch an EC2 instance with httpd service created via commands in the userdata section

EC2_Env_IAM_Role.yml - CloudFormation template to create an EC2 instance with full access to S3. Parameters are Environment, InstanceType, Subnet, SecurityGroups and KeyValuePair

EC2_Cf-Init.yml - CF template to launch an EC2 instance with httpd service created via cf-init
