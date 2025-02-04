variable "vpc_cidr" {
  type    = string
  description = "Enter the VPC CIDR Value."
}

variable "test_vpc" {
type = string
description = "Enter the Value for VPC"
}

//dynamic ingress and egress security group
variable "security_group_rules" {
    type = object({
    ingress = list(object({
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port = number
      to_port = number
      protocol = string
      cidr_blocks = list(string)
    }))
    })

default = {
    ingress = [
      {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["100.123.1.0/32"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["100.123.2.0/32"]
    }
  ]
  egress = [
      {
       from_port = 0
       to_port = 0
       protocol = "-1"
       cidr_blocks = ["0.0.0.0/0"]
      }
     ]
    }
  }

