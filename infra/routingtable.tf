resource "aws_route_table" "public_internet_rt" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table" "private_internet_rt" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_internet_rt.id
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet)
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_internet_rt.id
}

resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private_internet_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
