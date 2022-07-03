terraform {
	required_version = "0.14.4"
	
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.21.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  profile = "tfcourse"
}

resource "aws_s3_bucket" "created-test-bucket" {
  bucket = "my-tf-test-bucket-54d54f8s4d654fd"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby = "Terraform"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.created-test-bucket.id
  acl    = "private"
}