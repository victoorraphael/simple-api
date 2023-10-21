resource "aws_instance" "frontend" {
  availability_zone = var.region
  ami               = var.ami
  instance_type     = "t2.micro"

  private_ip = "10.0.1.10"
  subnet_id  = aws_subnet.simpleapi_frontend_subnet.id
  security_groups = [
    aws_security_group.allow_all_ssh.id,
    aws_security_group.simpleapi_frontend_sg.id,
  ]

  tags = {
    Name = "EC2-simpleapi-frontend"
  }
}

resource "aws_instance" "backend" {
  availability_zone = var.region
  ami               = var.ami
  instance_type     = "t2.micro"

  key_name = var.ssh_key_name
  private_ip = "10.0.2.10"
  subnet_id  = aws_subnet.simpleapi_backend_subnet.id
  security_groups = [
    "${aws_security_group.allow_all_ssh.id}",
    "${aws_security_group.simpleapi_backend_sg.id}",
  ]

  tags = {
    Name = "EC2-simpleapi-backend"
  }
}

resource "aws_instance" "database" {
  availability_zone = var.region
  ami               = var.ami
  instance_type     = "t2.micro"

  private_ip = "10.0.3.10"
  subnet_id  = aws_subnet.simpleapi_db_subnet.id
  security_groups = [
    aws_security_group.allow_all_ssh.id,
    aws_security_group.simpleapi_database_sg.id
  ]

  tags = {
    Name = "EC2-simpleapi-database"
  }
}
