# frontend
resource "aws_subnet" "simpleapi_frontend_subnet" {
  vpc_id = aws_vpc.simpleapi_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.region

  map_public_ip_on_launch = true

  tags = {
    Name = "simpleapi_frontend | 10.0.1.0/24"
  }
}

# backend
resource "aws_subnet" "simpleapi_backend_subnet" {
  vpc_id = aws_vpc.simpleapi_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.region

  map_public_ip_on_launch = true

  tags = {
    Name = "simpleapi_backend | 10.0.2.0/24"
  }
}

# database
resource "aws_subnet" "simpleapi_db_subnet" {
  vpc_id = aws_vpc.simpleapi_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.region

  tags = {
    Name = "simpleapi_database | 10.0.3.0/24" 
  }
}
