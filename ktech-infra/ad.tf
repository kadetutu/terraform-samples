resource "aws_directory_service_directory" "test_ad" {
  name     = "DevAD.teslab.net"
  password = data.aws_ssm_parameter.secret.value
  edition  = "Standard"
  type     = "MicrosoftAD"
  #for_each      = toset(data.aws_subnets.my_subnets.ids)
  vpc_settings {
    vpc_id     = data.aws_vpc.main_vpc.id
    subnet_ids = ["subnet-03f38dd28e1f759a2", "subnet-0a253ade487ab66cf"]
  }

  tags = {
    Project     = "Test"
    Environment = "Dev"
  }
}