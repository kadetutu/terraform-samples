data "aws_vpc" "main_vpc" {
  id = "vpc-082872d356334ecf3"
}

data aws_subnets "my_subnets" {
    filter {
      name = "vpc-id"
      values = [ data.aws_vpc.main_vpc.id ]
    }
    # filter {
    #   name  = "tag:Name"
    #   values = ["Public"]
    # }
}

data "aws_subnet" "my_subnets" {
  for_each = toset(data.aws_subnets.my_subnets.ids)
  id       = each.value
}


variable "secret_password_name" {
	type = string
  default = "ADPassword"
}

data "aws_ssm_parameter" "secret" {
	name = var.secret_password_name
	with_decryption = false
}
