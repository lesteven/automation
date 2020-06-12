import os

do_token = input('Enter digital ocean token file location: ')

do_token = os.path.expanduser(do_token)
token_val = ''
with open(do_token, 'r') as output:
    token_val = output.read().strip()

filename = 'terraform.tfvars'
with open(filename, 'w') as output:
    output.write(f'do_token = "{token_val}"')

print("terraform.tfvars file has been created")
