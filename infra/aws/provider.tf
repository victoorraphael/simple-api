terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  shared_config_files = [ "~/.aws/credentials" ]
  region = var.region
}
