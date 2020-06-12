import os

do_token = input('Enter digital ocean token file location: ')
# eg. do_token = "~/.ssh/foo"


# grabs do_token value from file and will append to tfvars file
do_token = os.path.expanduser(do_token)
token_val = ''
with open(do_token, 'r') as output:
    token_val = output.read().strip()

# create and append to tfvars file
filename = 'terraform.tfvars'
with open(filename, 'w') as output:
    output.write(f'do_token = "{token_val}"')

print("terraform.tfvars file has been created")
