output "hsm_admin_role_arn" {
  description = "CloudHSM Admin Role ARN"
  value       = aws_iam_role.hsm_admin.arn
}

output "hsm_admin_role_name" {
  description = "CloudHSM Admin Role Name"
  value       = aws_iam_role.hsm_admin.name
}

output "kms_admin_role_arn" {
  description = "KMS Admin Role ARN"
  value       = aws_iam_role.kms_admin.arn
}

output "kms_admin_role_name" {
  description = "KMS Admin Role Name"
  value       = aws_iam_role.kms_admin.name
}
