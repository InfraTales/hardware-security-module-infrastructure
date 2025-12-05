variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "enable_key_rotation" {
  description = "Enable automatic key rotation"
  type        = bool
  default     = true
}

variable "kms_admin_arns" {
  description = "List of IAM ARNs for KMS key administrators"
  type        = list(string)
  default     = []
}

variable "kms_user_arns" {
  description = "List of IAM ARNs for KMS key users"
  type        = list(string)
  default     = []
}
