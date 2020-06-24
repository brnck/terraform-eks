terraform {
  backend "s3" {
    bucket = "brnck-eks-terraform-state"
    key    = "aws/eks"
    region = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.0"
}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}
