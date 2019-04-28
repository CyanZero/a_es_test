//network.tf
resource "aws_vpc" "default" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    Name = "test-env"
  }
}
