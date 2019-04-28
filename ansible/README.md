
# Steps:
* git
* vi ~/.ssh/test.pem and add in the private key
* eval "$(ssh-agent -s)"
* ssh-add ~/.ssh/test.pem
* chmod 0400 ~/.ssh/test.pem
* export ANSIBLE_HOST_KEY_CHECKING=False
* export AWS_ACCESS_KEY_ID='YOUR_AWS_API_KEY'
* export AWS_SECRET_ACCESS_KEY='YOUR_AWS_API_SECRET_KEY'
* change ./dev_aws/inventory/ec2.ini:
	* Update aws_key and aws_id accordingly
	* vpc_destination_variable = private_ip_address (For actual setup in ansible server)
* Run commend to test setting:
```./dev_aws/inventory/ec2.py --list```
* Run setup:
```ansible-playbook -i dev_aws/ playbooks/server_conf.yml --diff```

* Verify ElasticSearch server:
```curl -u calvin ${ip_of_web_server}```

