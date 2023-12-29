data "aws_vpcs" "main_vpc" {
  tags = {
    name = "Project VPC"
  }
}

data aws_subnets "my_subnets" {
    filter {
      name = "vpc-id"
      values = [ aws_vpcs.main_vpc.id ]
    }
    filter {
      name  = "tag:Name"
      values = ["Public"]
    }
}

