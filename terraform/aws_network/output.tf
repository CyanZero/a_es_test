output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

output "vpc_security_group_id" {
  value = "${aws_security_group.ingress-all-test.id}"
}

output "subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}

output "private_subnet_id" {
  value = "${aws_subnet.private_subnet.id}"
}

output "subnet_id_b" {
  value = "${aws_subnet.public_subnet_b.id}"
}

output "key_name" {
  value = "${aws_key_pair.terraform_ec2_key.key_name}"
}
