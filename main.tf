
provider "aws" {
  region = "ap-northeast-1"
}


module "vpc_module" {
  source = "./modules/vpc"
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  vcp_Name = "dev-vpc"

  PublicSubnet_1a_cidr_block              = "10.0.1.0/24"
  PublicSubnet_1a_availability_zone       = "ap-northeast-1a"
  PublicSubnet_1a_Name                    = "public-subnet-01.ap-northeast-1a.aws"

  PublicSubnet_1c_cidr_block              = "10.0.2.0/24"
  PublicSubnet_1c_availability_zone       = "ap-northeast-1c.subnet"
  PublicSubnet_1c_Name                    = "public-subnet-01.ap-northeast-1c.aws"

  PrivateSubnet_1a_cidr_block              = "10.0.65.0/24"
  PrivateSubnet_1a_availability_zone       = "ap-northeast-1a"
  PrivateSubnet_1a_Name                    = "private-subnet-01.ap-northeast-1a.aws"

  PrivateSubnet_1c_cidr_block              = "10.0.66.0/24"
  PrivateSubnet_1c_availability_zone       = "ap-northeast-1c"
  PrivateSubnet_1c_Name                    = "private-subnet-01.ap-northeast-1c.aws"

}

module "default_sg" {
  source      = "./modules/security_group"
  name        = "module-sg"
  vpc_id      = module.vpc_module.vpc_id
  port        = 443
  cidr_blocks = ["0.0.0.0/0"]
}
