
resource "aws_vpc" "aws_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.vcp_Name
  }
}

resource "aws_internet_gateway" "aws_internet_gateway" {
  vpc_id = aws_vpc.aws_vpc.id
}

resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.aws_vpc.id
  cidr_block              = var.PublicSubnet_1a_cidr_block
  availability_zone       = var.PublicSubnet_1a_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.PublicSubnet_1a_Name
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id                  = aws_vpc.aws_vpc.id
  cidr_block              = var.PublicSubnet_1c_cidr_block
  availability_zone       = var.PublicSubnet_1c_availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.PublicSubnet_1c_Name
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id                  = aws_vpc.aws_vpc.id
  cidr_block              = var.PrivateSubnet_1a_cidr_block
  availability_zone       = var.PrivateSubnet_1a_availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = var.PrivateSubnet_1a_Name
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id                  = aws_vpc.aws_vpc.id
  cidr_block              = var.PrivateSubnet_1c_cidr_block
  availability_zone       = var.PrivateSubnet_1c_availability_zone
  map_public_ip_on_launch = false

  tags = {
    Name = var.PrivateSubnet_1c_Name
  }
}

output "vpc_id" {
  value = aws_vpc.aws_vpc.id
}