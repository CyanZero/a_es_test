//gateways.tf
resource "aws_internet_gateway" "test-env-gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "test-env-gw"
  }
}
