variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket" {
  description = "The S3 bucket for Terraform state backend"
  type        = string
}

variable "s3_key" {
  description = "The S3 key for the state file"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "The availability zones for the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "The CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "The CIDR blocks for public subnets"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to enable a NAT Gateway"
  type        = bool
}

variable "enable_vpn_gateway" {
  description = "Whether to enable a VPN Gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Whether to use a single NAT Gateway"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to the VPC resources"
  type        = map(string)
}

