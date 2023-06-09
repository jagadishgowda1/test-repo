# Create VPC
resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "TF-vpc-dev"
  }
}

# Create Subnets
resource "aws_subnet" "vpc-dev-public-subnet-1" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.aws_availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "TF-PublicSubnet"
  }
}

#create a second subnet if required
/*
#Resource-2: Create Subnets
resource "aws_subnet" "vpc-dev-private-subnet-1" {
  vpc_id                  = aws_vpc.vpc-dev.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.aws_availability_zone2
  map_public_ip_on_launch = true
  tags = {
    Name = "TF-PrivateSubnet"
  }
}
*/


#Resource-3: Internet Gateway
resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
  tags = {
    Name = "TF-IGW"
  }
}

#Resource-4: Create Route Table
resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id

  tags = {
    Name = "TF-RT"
  }
}

# Resource-5: Create Route in Route Table for Internet Access
resource "aws_route" "vpc-dev-public-route" {
  route_table_id         = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-dev-igw.id
}

# Resource-6: Associate Route Table with the Subnet
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id      = aws_subnet.vpc-dev-public-subnet-1.id
}
