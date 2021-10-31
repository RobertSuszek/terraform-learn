resource "aws_vpc" "fortigate_lab" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"
  tags = {
    Name = "Fortigate test"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.fortigate_lab
  cidr_block = var.public_subnet
  tags = {
    Name = "Public subnet"
  }
}