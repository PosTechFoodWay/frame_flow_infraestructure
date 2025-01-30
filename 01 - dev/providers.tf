provider "aws" {
  alias = "dev-workload-1",
  region = "us-east-1",
  profile = "dev-workload-1"
  default_tags {
    tags = {
      "env"         = "dev"
      "cloud"       = "AWS"
      "IAC"         = "Terraform"
      "IAC_version" = "5.68.0"
    }
  }
}