terraform {
  backend "s3" {
    bucket = "rosh-advanced-multi-tier"
    key    = "multi-tier-architecture-advanced/terraform.tfstate"
    region = "ap-south-1"
  }
}