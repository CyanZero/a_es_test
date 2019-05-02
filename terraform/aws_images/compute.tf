resource "aws_instance" "bastion_server" {
  count                       = "${var.bastion_count}"
  ami                         = "${var.bastion_image}"
  instance_type               = "${var.bastion_machine_type}"
  availability_zone           = "${var.zone}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true

  tags {
    Name = "${var.bastion_name}"
  }

  security_groups = ["${var.vpc_security_group_id}"]
  subnet_id       = "${var.subnet_id}"
}

resource "aws_instance" "web_server" {
  ami                         = "${var.web_server_image}"
  instance_type               = "${var.web_server_machine_type}"
  availability_zone           = "${var.zone}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true
  count                       = "${var.web_server_count}"

  tags {
    Name = "${var.web_server_name}"
  }

  security_groups = ["${var.vpc_security_group_id}"]
  subnet_id       = "${var.subnet_id}"
}

resource "aws_instance" "slave_server" {
  count                       = "${var.slave_server_count}"
  instance_type               = "${var.slave_server_machine_type}"
  availability_zone           = "${var.zone}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = true

  ami = "${var.web_server_image}"

  tags {
    Name = "${var.slave_server_name}"
  }

  security_groups = ["${var.vpc_security_group_id}"]
  subnet_id       = "${var.subnet_id}"
}
