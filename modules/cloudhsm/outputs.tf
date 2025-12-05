output "cluster_id" {
  description = "CloudHSM Cluster ID"
  value       = aws_cloudhsm_v2_cluster.main.id
}

output "cluster_state" {
  description = "CloudHSM Cluster State"
  value       = aws_cloudhsm_v2_cluster.main.cluster_state
}

output "cluster_certificates" {
  description = "CloudHSM Cluster Certificates"
  value       = aws_cloudhsm_v2_cluster.main.cluster_certificates
  sensitive   = true
}

output "security_group_id" {
  description = "CloudHSM Security Group ID"
  value       = aws_security_group.cloudhsm.id
}

output "hsm_ids" {
  description = "CloudHSM HSM Instance IDs"
  value       = aws_cloudhsm_v2_hsm.main[*].hsm_id
}
