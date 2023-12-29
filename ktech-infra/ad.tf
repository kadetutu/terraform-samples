resource "aws_directory_service_directory" "test_ad" {
  name     = "Dev-AD"
  password = jsondecode(data.aws_secretsmanager_secret_version.ad_password.secret_string)["AD_PASSWORD"]
  edition  = "Standard"
  type     = "MicrosoftAD"

  vpc_settings {
    vpc_id     = data.aws_vpcs.main_vpc.id
    subnet_ids = [for s in data.aws_subnets.my_subnets : s.cidr_block]
  }

  tags = {
    Project     = "Test"
    Environment = "Dev"
  }
}