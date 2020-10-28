# VPC Peering
VPC peering enables resources to route traffic between them using private IPv4 or IPv6 address. The two VPCs can be within the same account or different account and same region (intra-region) or different region (inter-region).

## VPC Peering Connection from AWS MC
Consider two VPCs - VPC-A (called as requestor VPC) and VPC-B (called as peer VPC), each with two subnets - Public-A, Private-A and Public-B, Private-B. 

### To establish peering connection between them, follow the below steps :
* Login to account containing VPC-A. Go to the VPC peering and create a new connection. Select the requestor VPC ID (here VPC-A) and enter the account and region of the peer VPC ( here VPC-B). 
* Go the account containing VPC-B. Accept the peering request from VPC-A in the VPC.
* To enable the flow of traffic between the VPCs, manually add a route to one or more VPC route tables as below.
  - Add a route in the route table of Public-A subnet to allow traffic from IP addresses of the Private-B subnet.
  - Add a route in the route table of Private-B subnet to allow traffic from IP addresses of the Public-A subnet.
* Provision EC2 instances in the Public-A and Private-B subnets
* Connect to the EC2 instance provisioned in the Public-A subnet using its public address and try to ping the private IP address of the EC2 instance provisioned in the Private-B subnet. We should get a successfull response if everything is configured properly.

## VPC Peering Connection using Cloudformation templates
Consider two AWS accounts - requestor and acceptor. To establish VPC peering between the VPCs in these accounts using CF, follow the below steps
* Login to the acceptor account and go to cloudformation console. Create a stack named 'Acceptor-VPC-Stack' using the template acceptor-cf-template.yml. It has two parameters - AcceptorVPCCidrBlock and PeerRequestorAccountId. This will create a VPC and a role with a permission to accept the VPC peering connection in the acceptor account. Note down the VPC Id and role ARN created.
* Login to the requestor account using an IAM user, as we cannot assume role with root account. Go to the cloudformation console and create a stack named 'Requestor-VPC-Stack' using the template requestor-cf-template.yml. This template has 5 parameters - PeerAcceptorAccountId, PeerAcceptorVPCId, PeerRegion, PeerRoleArn and RequestorVPCCidrBlock
This will create a VPC and VPC Peering connection between this new VPC and the VPC created in the acceptor account. The request will be accepted automatically by assuming the role created in the step 1.

Configurations to be done manually :
* Add a route in the route tables of the subnets in each of the two VPCs to allow resources to communicate with each other using the IPv4 addresses. Modify the security groups attached to the EC2 instances to allow traffic as per the requirement.
