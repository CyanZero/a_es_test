// Samples for common variables
// Modify below variables based on your GCP project
project = "dev-project"

region = "ap-southeast-1"

zone = "ap-southeast-1a"

credential = "~/.aws/credentials"

aws_key_name = "terraform_ec2_key"

public_key = ""

stages = "dev"

web_server_image = "ami-0dad20bd1b9c8c004"

tomcat_server_type = "tomcat-server"

cidr_block = "10.0.0.0/16"

//network
alb_name = "elk-alb"

alb_subnets = ""

internal_alb = ""

idle_timeout = 10

alb_security_groups = ""

s3_bucket = ""

alb_listener_port = 443

alb_listener_protocol = "HTTPS"

alb_target_group = "alb-elk-group"

svc_port = 9200

vpc_id = "vpc-0981b16e"

priority = 1000

alb_path = ""

target_group_name = "elk-group"

target_group_sticky = ""

target_group_path = "/"

target_group_port = 9200

// servers
bastion_image = "ami-0dad20bd1b9c8c004"

bastion_count = 0

bastion_name = "bastion-server"

bastion_machine_type = "t2.micro"

bastion_size = 10

web_server_count = 1

web_server_name = "web-server"

web_server_machine_type = "t2.small"

web_server_size = 10

slave_server_count = 1

slave_server_name = "slave-server"

slave_server_machine_type = "t2.small"

slave_server_size = 10
