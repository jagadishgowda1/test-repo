# Create Security Group - SSH Traffic
resource "aws_security_group" "vpc-ssh" {
  vpc_id      = aws_vpc.vpc-dev.id
  name        = "vpc-ssh"
  description = "VPC SSH"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Security Group - Web Traffic
resource "aws_security_group" "vpc-web" {
  vpc_id      = aws_vpc.vpc-dev.id
  name        = "vpc-web"
  description = "VPC Web"

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #-1 here refers to open to all. 
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "TF-SG"
  }
}