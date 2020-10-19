# CloudFormation Templates for lauching VPC and its components
VPC Components - VPC, Subnets, InternetGateway, GatewayAttachment, RouteTable, Route Creation, SubnetRouteTableAssociation

VPC_1_Pri_1_Pub_Subnets.json - CF Template to create a VPC with one public and one private subnets. No parameters.

VPC_1_Subnet.json - CF template to create a VPC and a subnet(private) in AZ. Parameters - Cidr block, Subnet range and AZ.

VPC_2_Pri_2_Pub_Subnets.json - CF Template to create a VPC with 2 public and 2 private subnets. No parameters. Similar to VPC_1_Pri_1_Pub_Subnets.json

VPC_2_PriSub_MySQL_RDS.json - CF template to create a VPC with 2 subnets, MySQL RDS Instance, DB Subnet Group and RDS Secuirty Group. Parameters - DB Username and Password.

VPC_Pri_Pub_Subnets_NAT.json - CF Template to create a VPC and a private and public subnets. Private subnet has internet access via NAT gateway. Parameters - VPC Cidr block, Pubic Subnet Cidr, Private Subnet Cidr, Public AZ and Private AZ.
