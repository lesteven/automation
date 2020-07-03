provider "aws" {
  profile = var.profile
  region = var.region
  shared_credentials_file = var.cred_file
}

#output
output "ip" {
  value = "${aws_instance.example.public_ip}"
  description = "Public ip address of instance"
}

resource "aws_instance" "example" {
  ami = lookup(var.ami, var.region)
  instance_type = "t2.micro"
  key_name = var.key_name
}
