import os

key_name = input('Enter aws key name: ')
# eg foo, dont include pem file extension! eg. foo.pem


# create and append to tfvars file
filename = 'terraform.tfvars'
with open(filename, 'w') as output:
    output.write(f'key_name = "{key_name}"\n')

print("terraform.tfvars file has been created")
