Digital Ocean Automation for Go Server

Steps:

1. Run: `python generateTfvar.py`

 This will generate terraform.tfvars file for you; you will need to input
the file location of your Digital Ocean token. (eg. ~/.ssh/foo)

 The file's contents should contain only one line. (eg. abcd123)
Visit this link for instructions on how to create a token:
https://www.digitalocean.com/docs/apis-clis/api/create-personal-access-token/

How to launch the digital ocean server
----
* execute launch.sh and enter the dir goDO as input
