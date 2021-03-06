import os

do_token = input('Enter digital ocean token file location: ')
# eg. do_token = "~/.ssh/foo"

ssh_key = input('Enter ssh key name: ')
# eg. ssh_key = 'foo' -> will turn into foo and foo.pub

repo = input('Enter git repo: ')
# eg. https:/github.com/user/repo.git


# grabs do_token value from file and will append to tfvars file
# os.path.expanduser -> to expand ~ (tilde)
do_token = os.path.expanduser(do_token)
token_val = ''
with open(do_token, 'r') as output:
    token_val = output.read().strip()

# create and append to tfvars file
filename = 'terraform.tfvars'
with open(filename, 'w') as output:
    output.write(f'do_token = "{token_val}"\n')
    output.write(f'ssh_pubkey = "{ssh_key}.pub"\n')
    output.write(f'ssh_privkey = "{ssh_key}"\n')
    output.write(f'repo = "{repo}"\n')

print("terraform.tfvars file has been created")
