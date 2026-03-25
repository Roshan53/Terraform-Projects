# testing github actions
module "vpc" {
  source                    = "./modules/vpc"
  project_name              = var.project_name
  vpc_cidr                  = var.vpc_cidr
  public_subnet_1_cidr      = var.public_subnet_1_cidr
  public_subnet_2_cidr      = var.public_subnet_2_cidr
  private_app_subnet_1_cidr = var.private_app_subnet_1_cidr
  private_app_subnet_2_cidr = var.private_app_subnet_2_cidr
  private_db_subnet_1_cidr  = var.private_db_subnet_1_cidr
  private_db_subnet_2_cidr  = var.private_db_subnet_2_cidr
}

module "security" {
  source       = "./modules/security"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
}

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

module "asg" {
  source                 = "./modules/asg"
  project_name           = var.project_name
  instance_type          = var.instance_type
  app_sg_id              = module.security.app_sg_id
  private_app_subnet_ids = module.vpc.private_app_subnet_ids
  target_group_arn       = module.alb.target_group_arn
  desired_capacity       = var.desired_capacity
  min_size               = var.min_size
  max_size               = var.max_size
  aws_region             = var.aws_region
  instance_profile_name  = module.iam.instance_profile_name
}

module "rds" {
  source                = "./modules/rds"
  project_name          = var.project_name
  private_db_subnet_ids = module.vpc.private_db_subnet_ids
  db_sg_id              = module.security.db_sg_id
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_instance_class     = var.db_instance_class
}

module "monitoring" {
  source       = "./modules/monitoring"
  project_name = var.project_name
  asg_name     = module.asg.asg_name
}