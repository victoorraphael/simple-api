resource "aws_key_pair" "my_key_pair" {
  key_name   = var.ssh_key_name
  public_key = file("~/.ssh/id_rsa.pub")
}