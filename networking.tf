resource "aws_vpc" "terraform_test_vpc" {
  cidr_block         = var.vpc_cidr
  enable_dns_hostnames = false
  enable_dns_support   = true

lifecycle { 
    create_before_destroy = true 
  } 


  tags = {
    Name = var.test_vpc
  }
}

