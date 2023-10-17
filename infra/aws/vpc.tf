resource "aws_vpc" "simpleapi_vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "simpleapi_vpc"
  }
}

resource "aws_internet_gateway" "simpleapi_igw" {
  vpc_id = aws_vpc.simpleapi_vpc
}


resource "aws_route_table" "simpleapi_public_rt" {
  vpc_id = aws_vpc.simpleapi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.simpleapi_igw.id
  }
}

// frontend
resource "aws_route_table_association" "rta_subnet_public_frontend" {
  subnet_id = aws_subnet.simpleapi_frontend_subnet.id
  route_table_id = aws_route_table.simpleapi_public_rt.id
}

// backend
resource "aws_route_table_association" "rta_subnet_public_backend" {
  subnet_id = aws_subnet.simpleapi_backend_subnet.id
  route_table_id = aws_route_table.simpleapi_public_rt.id
}

// database
resource "aws_route_table_association" "rta_subnet_public_database" {
  subnet_id = aws_subnet.simpleapi_db_subnet.id
  route_table_id = aws_route_table.simpleapi_public_rt.id
}
