/*
 * NAT Instance
 * TODO: Should use NAT_GATEWAY in production ENV
*/
resource "aws_key_pair" "terraform_ec2_key" {
  key_name   = "terraform_ec2_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDqv6a6BOsV/Gr+B9rvQOIQBgtC4cC6RyI91kRopBAlMsILv0shUj3FHiy2iIfsX+hbRM1gibuJO61pQlpqxLLsp94iZErBb5KkYjqc45SJSm3Tgxebz4wAyVtlorH/qdEb9pJ9JntYgVTmaOvuqVKWHWbkx1VUqQ1Sv9HJBOGeutD7z4UoOMVc9GcWks7P4BlZkgmwhRcQP4X638LVNmJTq2lK+rAGWX7NB9uN0zmM9Lz05Tj24jR7zEbxdaOiFF0NstCALcYBMsZ4CGA3n3iAPA4fszO0WW5Lgh0sHWXpnCLghDQd9ir8Rf3ZOJ6Z8Dny+78UlmR0fTA8Dq0x8B16aaDO+1QmvIjMmeAIaYE0pOwh4XIdZcAihP+sHCNfcl0DZrIGOb8J/9MIK3jpca+U+XEEjzNErC1sbGjIR0VDVXOQi8tuIVGHVGC3JTq+yIV1LYFNzMk3ALXNogHNok4yB+7AcZ6JguD2NfWdnimOfaCzOIA0C4jHnDDXpEkoiT3HuwGXebs+LUoix6c63ham9kcbvq+GI2Kklo8I4YbtOln9gCyvw9TYpYhBBwzyqrwaDZT3+kbp7N5LTr3u45Gb/XDrrq39TdaEbb74zraSvfXjiCMG37Umw9fe17BMItBN50CUi4WG//ydBmKbyz3ZFcM8dO/Xm8zl70vrYyrePw== calvin@coss.io"
}

data "aws_ami" "nat" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-vpc-nat*"]
  }

  owners = ["amazon"]
}

resource "aws_security_group" "nat" {
  name        = "vpc_nat"
  description = "Allow traffic to pass from the private subnet to the internet"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${aws_vpc.default.cidr_block}"]
  }

  egress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "NATSG"
  }
}

resource "aws_instance" "nat" {
  count                       = 1
  ami                         = "${data.aws_ami.nat.id}"
  availability_zone           = "${var.zone}"
  instance_type               = "m1.small"
  key_name                    = "${aws_key_pair.terraform_ec2_key.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.nat.id}"]
  subnet_id                   = "${aws_subnet.public_subnet.id}"
  associate_public_ip_address = true
  source_dest_check           = false

  tags {
    Name = "VPC NAT"
  }
}

resource "aws_eip" "nat" {
  instance = "${aws_instance.nat.id}"
  vpc      = true
}
