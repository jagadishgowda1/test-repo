output "ec2_instance_public_ip" {
     description = "EC2 Instance Public IP"
     value = aws_eip.public_ip.public_ip  #[count.index]
  
}


output "ec2_instance_private_ip" {
   description = "EC2 Instance Private IP"
     value = aws_instance.my-ec2-vm.id
}


output "ec2_instance_availability_zone" {
   description = "EC2 Instance AZ"
     value = aws_instance.my-ec2-vm.availability_zone
}


output "ec2_instance_id" {
     description = "EC2 Instance id"
     value = aws_instance.my-ec2-vm.id
}



output "ec2_instance_public_dns" {
     description = "EC2 Instance Public DNS"
     value = aws_eip.public_ip.public_dns
}
