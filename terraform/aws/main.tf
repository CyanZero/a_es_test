#### Resolve all the variables defined in modules ####
############ the variables in this file are passed in at environment level ############
provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.credential}"
  profile                 = "terraform"
}

module vpc {
  source = "../aws_network"

  cidr_block = "${var.cidr_block}"
}

module web {
  source = "../aws_images"

  vpc_id                = "${module.vpc.vpc_id}"
  vpc_security_group_id = "${module.vpc.vpc_security_group_id}"
  subnet_id             = "${module.vpc.subnet_id}"
  private_subnet_id     = "${module.vpc.private_subnet_id}"
  key_name              = "${module.vpc.key_name}"

  //Overall env info
  zone   = "${var.zone}"
  stages = "${var.stages}"

  web_server_image = "${var.web_server_image}"
  bastion_image    = "${var.bastion_image}"

  //servers
  bastion_name            = "${var.bastion_name}"
  bastion_size            = "${var.bastion_size}"
  bastion_machine_type    = "${var.bastion_machine_type}"
  bastion_count           = "${var.bastion_count}"
  web_server_name         = "${var.web_server_name}"
  web_server_size         = "${var.web_server_size}"
  web_server_machine_type = "${var.web_server_machine_type}"
  web_server_count        = "${var.web_server_count}"

  slave_server_name         = "${var.slave_server_name}"
  slave_server_size         = "${var.slave_server_size}"
  slave_server_machine_type = "${var.slave_server_machine_type}"
  slave_server_count        = "${var.slave_server_count}"
}
