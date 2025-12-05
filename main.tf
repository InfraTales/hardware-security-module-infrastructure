# ============================================================================
# CloudHSM and KMS Infrastructure
# ============================================================================

# VPC Module for CloudHSM
module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
  azs          = var.azs
}

# KMS Module
module "kms" {
  source = "./modules/kms"

  project_name        = var.project_name
  environment         = var.environment
  enable_key_rotation = var.enable_key_rotation
  kms_admin_arns      = var.kms_admin_arns
  kms_user_arns       = var.kms_user_arns
}

# CloudHSM Module
module "cloudhsm" {
  source = "./modules/cloudhsm"

  project_name    = var.project_name
  environment     = var.environment
  vpc_id          = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  hsm_instance_type  = var.hsm_instance_type
}

# IAM Module
module "iam" {
  source = "./modules/iam"

  project_name      = var.project_name
  environment       = var.environment
  cloudhsm_cluster_id = module.cloudhsm.cluster_id
  kms_key_arns      = module.kms.key_arns
}

# Monitoring Module
module "monitoring" {
  source = "./modules/monitoring"

  project_name      = var.project_name
  environment       = var.environment
  cloudhsm_cluster_id = module.cloudhsm.cluster_id
  kms_key_ids       = module.kms.key_ids
  alert_email       = var.alert_email
}
