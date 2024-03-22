resource "aws_eip" "eip" {
  domain = "vpc"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id

  subnet_id = aws_subnet.public_subnets[0].id

  tags = {
    Name = "nat_gateway"
  }
}
