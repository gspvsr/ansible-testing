provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 1.8.5, <= 1.11.1" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 6.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "gsp21101983-02"
    key            = "Ansible.tfstate"
    region         = "us-east-2"
    # dynamodb_table = "-terraform-locks"
    encrypt        = true
  }
}