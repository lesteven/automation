#!/bin/bash

# get terraform dir
read -p "Enter dir: " dir

# go to script dir
cd "$(dirname "$0")/$dir"

# get public_ip 
public_ip=$(terraform output ip)

# get key_file
# searches in terraform.tfvars with awk
# and removes quotes from string using sed
key_file=$(awk '{print $3}' terraform.tfvars | sed 's|["]||g')
key_file+=".pem"

ssh -tt -oStrictHostKeyChecking=no -i ~/.ssh/$key_file ubuntu@$public_ip
