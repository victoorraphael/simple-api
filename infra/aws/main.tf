resource "aws_instance" "frontend" {
  availability_zone = var.region
  ami = var.ami
  instance_type = "t3.medium"

  private_ip = "10.0.1.10/24"
  subnet_id = aws_subnet.simpleapi_frontend_subnet.id

  tags = {
    Name = "EC2-simpleapi-frontend"
  }
}

resource "aws_instance" "backend" {
  availability_zone = var.region
  ami = var.ami
  instance_type = "t3.medium"

  private_ip = "10.0.2.10/24"
  subnet_id = aws_subnet.simpleapi_backend_subnet.id

  tags = {
    Name = "EC2-simpleapi-backend"
  }
}

resource "aws_instance" "database" {
  availability_zone = var.region
  ami = var.ami
  instance_type = "t3.medium"

  private_ip = "10.0.3.10/24"
  subnet_id = aws_subnet.simpleapi_db_subnet.id

  tags = {
    Name = "EC2-simpleapi-database"
  }
}