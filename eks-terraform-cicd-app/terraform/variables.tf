variable "aws_region" {
  type = string
}

variable "project_name" {
  type    = string
  default = "rosh-eks-demo"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "public_subnet_1_cidr" {
  type    = string
  default = "10.20.1.0/24"
}

variable "public_subnet_2_cidr" {
  type    = string
  default = "10.20.2.0/24"
}

variable "private_subnet_1_cidr" {
  type    = string
  default = "10.20.11.0/24"
}

variable "private_subnet_2_cidr" {
  type    = string
  default = "10.20.12.0/24"
}

variable "github_repo" {
  type        = string
  description = "GitHub repo in format username/repo"
}