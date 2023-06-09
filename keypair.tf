#this config folder creates a key pair  

#creates a aws key pair key name is set in variables section

resource "aws_key_pair" "tf-key" {
key_name = var.aws_key_pair
public_key = tls_private_key.rsa.public_key_openssh
}

#key pair which has been created above is encrypted with RSA algorithm 4096 bits, we can change this accroding to requirement 
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}

#this creates a file in our working directory and download the aws key pair which we have created above
resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = var.aws_key_pair
}