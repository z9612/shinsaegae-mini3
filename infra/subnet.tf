resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = element(var.public_subnet, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Public Subnet0${count.index + 1}"
  }
}
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = element(var.private_subnet, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Private Subnet0${count.index + 1}"
  }
}

resource "aws_subnet" "rds_subnets" {
  count             = length(var.rds_subnet)
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = element(var.rds_subnet, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "RDS Subnet0${count.index + 1}"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = aws_subnet.rds_subnets[*].id
}


