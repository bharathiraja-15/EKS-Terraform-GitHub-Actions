terraform {
  required_version = "~> 1.9.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }

  backend "s3" {
    bucket         = "bharathiraja-tf-backend"
    region         = "eu-north-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "bharathiraja-lock-files"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
