#Ec2.tf this defines a single AWS machine with the config details declared, values are variabilized, edit as per requirement
resource "aws_instance" "my-ec2-vm" {
  subnet_id                   = aws_subnet.vpc-dev-public-subnet-1.id
  associate_public_ip_address = true
  ami                         = var.ec2_ami_id
  instance_type               = var.ec2_instance_type  #[count.index]
  root_block_device {
  volume_size = var.os_disk
    encrypted = true
    delete_on_termination = true
    volume_type = var.os_disk_type
  }
  
  #here we are referencing the aws key pair which we have created in keypair.tf config file
  key_name              = var.aws_key_pair

/*
  * This is a userdata area; if necessary or as per requirement, please add, amend or remove the user data. 
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to Redington Cloud ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF
  #userdata file ends above

*/

  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  
  #here we are attaching tags to our resources
  tags = {
    "Name" = "TF-impteamEC2 "

  }
}

#this creates a data disk EBS volume
resource "aws_ebs_volume" "data_disk" {
  availability_zone = var.aws_availability_zone
  size              = var.data_disk
  type = var.data_disk_type

  tags = {
    Name = "Data_Disk"
  }
}

#this attachs the data disk EBS volume created above to the server
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.data_disk.id
  instance_id = aws_instance.my-ec2-vm.id
}
