variable "profile" {
  default = "default"
}

variable "region" {
  default = "us-west-1"
}

variable "cred_file" {
    default = "~/.aws/credentials"
}

variable "key_name" {}

variable "ami" {
  default = {
    us-west-1 = "ami-063aa838bd7631e0b"
  }
}
