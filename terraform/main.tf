provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "fastapi-bkt"
    key    = "fastapi/tfstate"
    region = "us-east-1"
  }
}

module "vpc" {
  source = "./modules/vpc"

  name                = var.vpc_name
  cidr                = var.vpc_cidr
  azs                 = var.availability_zones
  private_subnets     = var.private_subnets
  public_subnets      = var.public_subnets
  enable_nat_gateway  = var.enable_nat_gateway
  enable_vpn_gateway  = var.enable_vpn_gateway
  single_nat_gateway  = var.single_nat_gateway

  tags = var.tags
}

