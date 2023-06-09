# Input Variables

# variable for region
variable "aws_region" {
description = "Region"
type = string
default = "us-east-1"    #change the region wrt to reqiurement
}

#variable for availability zone
variable "aws_availability_zone" {
description = "Availability Zone1"
type = string
default = "us-east-1a"
}

#variable for key pair
variable "aws_key_pair" {
    description = "enter the key pair name to be created"
    type = string
    default = "tf-key" /*this is the key name which is been going to create on AWS and download on your local if needed to change the key name
                        or wanted to give key name in runtime comment this line */  
}

/*
variable "aws_availability_zone2" {
description = "Availability Zone2"   use this if only needed 2nd availability zone
type = string
default = "ap-south-1b"
}

*/

#variable for AMI
variable "ec2_ami_id" {
description = "enter the AMI ID"
type = string
default = "ami-0715c1897453cabd1"  #this AMI id from ap-south-1 region, change accordingly comment this line if needed to add at runtime
#defaut = "ami-063b634d62a631728"-hyd
}

#variable for instance type
variable "ec2_instance_type" {
description = "EC2 Instance Type"
type = string
default = "t2.micro"
}

#variable for OS disk
variable "os_disk" {
description = "EC2 OS Disk in terms of numbers ex:20gb --> 20"
type = number
default = "15"
}


#variable for OS disk type
variable "os_disk_type" {
description = "Enter the type of OS disk --> gp2, gp3"
type = string
default = "gp3"
}


#variable for data disk
variable "data_disk" {
description = "EC2 DATA Disk in terms of numbers ex:20gb --> 20"
type = number
default = "130"
}

#variable for data disk type
variable "data_disk_type" {
description = "Enter the type of OS disk --> gp2, gp3"
type = string
default = "gp3"
}
