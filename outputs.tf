# VPC Outputs
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

# CloudHSM Outputs
output "cloudhsm_cluster_id" {
  description = "CloudHSM Cluster ID"
  value       = module.cloudhsm.cluster_id
}

output "cloudhsm_cluster_state" {
  description = "CloudHSM Cluster State"
  value       = module.cloudhsm.cluster_state
}

output "cloudhsm_security_group_id" {
  description = "CloudHSM Security Group ID"
  value       = module.cloudhsm.security_group_id
}

# KMS Outputs
output "kms_key_ids" {
  description = "KMS Key IDs"
  value       = module.kms.key_ids
}

output "kms_key_arns" {
  description = "KMS Key ARNs"
  value       = module.kms.key_arns
  sensitive   = true
}

# IAM Outputs
output "hsm_admin_role_arn" {
  description = "CloudHSM Admin Role ARN"
  value       = module.iam.hsm_admin_role_arn
}

# Monitoring Outputs
output "monitoring_dashboard_url" {
  description = "CloudWatch dashboard URL"
  value       = module.monitoring.dashboard_url
}
