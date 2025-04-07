
module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source = "./modules/sg"
  vpc = module.vpc.vpc
}

module "key" {
  source = "./modules/key"
}

module "frontend" {
  source = "./modules/frontend"
  vpc = module.vpc.vpc
  pub_sub = module.vpc.pub_sub
  front_sg_id= module.security_groups.front_sg_id
  key_name = module.key.key_name
  alb_sg_id =module.security_groups.alb_sg_id
}

module "backend" {
  source                = "./modules/backend"
  vpc               = module.vpc.vpc
  priv_sub       = module.vpc.priv_sub
  back_sg_id        = module.security_groups.back_sg_id
  alb_sg_id           = module.security_groups.alb_sg_id
  key_name              = module.key.key_name
}

module "database" {
  source                = "./modules/db"
  vpc               = module.vpc.vpc
  priv_sub      = module.vpc.priv_sub
  db_sg_id = module.security_groups.db_sg_id
  DBPass                = var.DBPass
}

output "DBPass" {
  value = "yousra" 
  
}
module "AutoScaling" {
  source                     = "./modules/ASG"
  pub_sub            = module.vpc.pub_sub
  priv_sub            = module.vpc.priv_sub
  front_lt_id                   = module.frontend.front_lt_id
  backend_lt_id                   = module.backend.backend_lt_id
  front_aws_lb_target_group_arn = module.frontend.front_aws_lb_target_group_arn
  backend_aws_lb_target_group_arn = module.backend.backend_aws_lb_target_group_arn
}