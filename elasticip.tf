#this creates and attach a public ip
resource "aws_eip" "public_ip" {
  vpc = true
  instance = aws_instance.my-ec2-vm.id  
}
