variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = "string"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

data "aws_vpc" "demo" {
    #id = "vpc-03005925d6ad1f7c8"
    tags ={
      Name = "My VPC"
    }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.demo.id}"

  tags = {
    Name = "Private Subnet*"
  }
}

