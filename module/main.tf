module "main-vpc" {
  source = "../Modules/vpc"
  ENV    = "dev"
  AWS_REGION = "ap-south-1"
}

module "instance" {
  source         = "../Modules/instance"
  ENV            = "dev"
  VPC_ID         = module.main-vpc.vpc_id
  PUBLIC_SUBNETS = module.main-vpc.public_subnets  
}
