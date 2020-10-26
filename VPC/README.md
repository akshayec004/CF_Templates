## CloudFormation Templates for launching VPC and its components
VPC Components - VPC, Subnets, InternetGateway, GatewayAttachment, RouteTable, Route Creation, SubnetRouteTableAssociation

VPC_1_Pri_1_Pub_Subnets.json - CF Template to create a VPC with one public and one private subnets. No parameters.

VPC_1_Subnet.json - CF template to create a VPC and a subnet(private) in AZ. Parameters - Cidr block, Subnet range and AZ.

VPC_2_Pri_2_Pub_Subnets.json - CF Template to create a VPC with 2 public and 2 private subnets. No parameters. Similar to VPC_1_Pri_1_Pub_Subnets.json

VPC_2_PriSub_MySQL_RDS.json - CF template to create a VPC with 2 subnets, MySQL RDS Instance, DB Subnet Group and RDS Secuirty Group. Parameters - DB Username and Password.

VPC_Pri_Pub_Subnets_NAT.json - CF Template to create a VPC and a private and public subnets. Private subnet has internet access via NAT gateway. Parameters - VPC Cidr block, Pubic Subnet Cidr, Private Subnet Cidr, Public AZ and Private AZ.

Template_Config.json - Template configuration file for CF templates. Contains parameters, tags and stack plcy for the CF stack

## VPC Peering
VPC peering enables resources to route traffic between them using private IPv4 or IPv6 address. The two VPCs can be within the same account or different account and same region (intra-region) or different region (inter-region).

Consider two VPCs - VPC-A (called as requestor VPC) and VPC-B (called as peer VPC), each with two subnets - Public-A, Private-A and Public-B, Private-B. 

### To establish peering connection between them, follow the below steps :
* Login in to account containing VPC-A. Go to the VPC peering and create a new connection. Select the requestor VPC ID (here VPC-A) and enter the account and region of the peer VPC ( here VPC-B). 
* Go the account containing VPC-B. Accept the peering request from VPC-A in the VPC.
* To enable the flow of traffic between the VPCs, manually add a route to one or more VPC route tables as below.
 i. Add a route in the route table of Public-A subnet to allow traffic from IP addresses of the private-B subnet.
 ii. Add a route in the route table of Private-B subnet to allow traffic from IP addresses pf the public-A subnet.
* Provision EC2 instances in the Public-A and Private-B subnets
* Connect to the EC2 instance provisioned in the Public-A subnet using its public address and try to ping the private IP address of the EC2 instance provisioned in the Private-B subnet. We should get a successfull response if everything is configured properly.
