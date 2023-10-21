resource "aws_key_pair" "deployer" {
  key_name   = "be_access_key"
  public_key = var.ssh_pub
}