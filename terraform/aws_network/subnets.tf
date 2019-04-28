//subnets.tf
resource "aws_route_table" "route-table-public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test-env-gw.id}"
  }

  tags {
    Name = "test-env-route-table"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block        = "${var.public_subnet_b_cidr}"
  availability_zone = "ap-southeast-1b"

  tags {
    Name = "Public Subnet"
  }
}

resource "aws_route_table_association" "subnet-association-public" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.route-table-public.id}"
}

// Private Subnet
resource "aws_route_table" "route-table-private" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.nat.id}"
  }

  tags {
    Name = "Private Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "ap-southeast-1a"

  tags {
    Name = "Private Subnet"
  }
}

resource "aws_route_table_association" "subnet-association-private" {
  subnet_id      = "${aws_subnet.private_subnet.id}"
  route_table_id = "${aws_route_table.route-table-private.id}"
}
