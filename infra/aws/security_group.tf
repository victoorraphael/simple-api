resource "aws_security_group" "simpleapi_frontend_sg" {
  name   = "frontend-sg"
  vpc_id = aws_vpc.simpleapi_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "simpleapi_backend_sg" {
  name   = "backend_sg"
  vpc_id = aws_vpc.simpleapi_vpc.id

  ingress {
    from_port   = 9000
    to_port     = 9000
    cidr_blocks = ["10.0.1.0/24"] // frontend
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "simpleapi_database_sg" {
  name   = "database_sg"
  vpc_id = aws_vpc.simpleapi_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    cidr_blocks = ["10.0.2.0/24"] // backend
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
