variable "aws_region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "rosh-eks-gitops"
}

variable "github_repo" {
  description = "GitHub repo in format username/repo"
  type        = string
}

variable "github_branch" {
  default = "main"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}