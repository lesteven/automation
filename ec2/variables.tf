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
    us-west-1 = "ami-0d705db840ec5f0c5"
  }
}
