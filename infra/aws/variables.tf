variable "region" {
  type = string
  default = "us-east-1"
}

variable "ami" {
  type = string
  default = "ami-0efbe8542ba48faf4" // ubuntu 20.04 LTS Focal Fossa
}

variable "ssh_key_name" {
  type = "string"
  default = "simpleapi_ssh"
}

variable "ssh_pub" {
  type = string
  default = "your_ssh_pub_key"
}