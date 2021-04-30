

resource "aws_vpc" "vpc_ac_245089" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "gateway_ac" {
  vpc_id = aws_vpc.vpc_ac_245089.id
}

resource "aws_default_route_table" "route_table_ac" {
  default_route_table_id = aws_vpc.vpc_ac_245089.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway_ac.id
  }

  tags = {
    Name = "Salida a internet"
  }
}

resource "aws_subnet" "vpc-subnet-us-east-1a" {
  vpc_id     = aws_vpc.vpc_ac_245089.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.az-1a
  map_public_ip_on_launch = true
  tags = {
    Name = "VPC US-East-1a"
  }
}