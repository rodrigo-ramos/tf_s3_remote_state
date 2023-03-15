terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}
# lc stands for lovecraft project
resource "aws_s3_bucket" "lc_remote_state" {
  bucket = "${var.prefix}-remote-state-${var.environment}"
  acl    = "authenticated-read"
  tags = {
    "Name"        = "${var.prefix}-remote-state-${var.environment}"
    "Environment" = var.environment
  }
}
resource "aws_s3_bucket_public_access_block" "my-terraform-state-bucket-public-access-block" {
  bucket = aws_s3_bucket.lc_remote_state.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}
