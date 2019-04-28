# Steps (Run Terraform locally):
* git clone https://github.com/CyanZero/a_es_test.git
* cd terraform
* Config ~/.aws/credential
* Check out the code
* Go into aws folder
* Generate key pair(store the pem and update terraform.tfvars key: public_key with public key)
```ssh-keygen(Rember to use passphrase)```
```assuming generated: private_key.pem and public_key.pub```
* Configure terraform.tfvars:
    * credential: To indicate the location of ~/.aws/credential
    * public_key: `cat public_key.pub` (This turns out a bug and need to update aws_network/nat.tf)
* Run command to setup infra:
```terraform init```
```terraform plan -var-file=terraform.tfvars```
```terraform apply -var-file=terraform.tfvars```

# Steps for Ansible

* export ANSIBLE_HOST_KEY_CHECKING=False
* export AWS_ACCESS_KEY_ID='YOUR_AWS_API_KEY'
* export AWS_SECRET_ACCESS_KEY='YOUR_AWS_API_SECRET_KEY'
* change ./dev_aws/inventory/ec2.ini:
	* vpc_destination_variable = ip_address

## Running Ansible locally:
This is used to setup ansible running ENV remotely
* git clone https://github.com/CyanZero/a_es_test.git
* cd ansible
* Run commend to test setting:
```./dev_aws/inventory/ec2.py --list```
* Run setup:
```ansible-playbook -i dev_aws/ playbooks/ansible_conf.yml --diff```

## Running Ansible remotely
* chmod 0400 ~/.ssh/private.pem
* eval "$(ssh-agent -s)"
* ssh-add ~/.ssh/private.pem
* ssh -A -i ~/.ssh/private.pem ubuntu@public_ip_of_bastion
* git clone https://github.com/CyanZero/a_es_test.git
* cd ansible
* Run commend to test setting:
```./dev_aws/inventory/ec2.py --list```
* Run setup:
```ansible-playbook -i dev_aws/ playbooks/server_conf.yml --diff ```

* Verify ElasticSearch server:
* Access to port 9200
* Access without authentication
* Access with authentication to port 80
```curl -u calvin ${ip_of_web_server}```
