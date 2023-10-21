variable "region" {
  type = string
  default = "us-east-1"
}

variable "ami" {
  type = string
  default = "ami-0ff834984748eaef2" // ubuntu 20.04 LTS Focal Fossa
}

variable "ssh_key_name" {
  type = string
  default = "simpleapi_ssh"
}

variable "ssh_pub" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDC1xAQVaA/qBV8g7+Ix6XRKlLImlkolDCEjbyCc7YeDcKrAr3EPhDJKgVNC1d0z8coZ9AhD7dCCBbjbgAM+1Enk+8oHEYE2sFiWsVagtjv3ub2dvUpUhojWBY24J9RQM8Axqc7OqTkEYD4EERypqHQoawvgCLSO++TH35Q+GRfJnoj0ouwolqOA/ZbVMdQYOlsH+vZW3846vR8RPvFsLW0XRYGOSnOBRRxfVUXhlQIPAtLVt9R4dnyFxg87l9rq5PW3t6XfVhzhCAiYp4tbsxl7DcFKp2H9C3Riz958VKXeXQ/Q9D7UitLTlSUkLxzZ1dgGiAARNXG2/QxKUSZCn261gyT7jfa2EarI4y5LZH6cLvNndyh9kRfN9ZdyUmplyniTfGfyT7/DeM1EG4NczJcLQKzCsDGCf7X+Ok8gy3Dz1trGbuKwsCpa/Yzuwd/fbPqvOI+6RObuqP9YJTknflkqkfAWxEBDg9eE49HW6hWTtMQANx+7h0ZqcJrwvIftR8= raphael@Raphaels-MacBook-Air.local"
}