terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
     
  backend "s3" {
    bucket = "s3-remotestate-terraform"
    key    = "remotestate-file-demo"
    # use_lockfile = true
    # encrypt = true
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}
