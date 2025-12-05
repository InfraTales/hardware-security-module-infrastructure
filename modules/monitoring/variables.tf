variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cloudhsm_cluster_id" {
  description = "CloudHSM Cluster ID"
  type        = string
}

variable "kms_key_ids" {
  description = "KMS Key IDs"
  type        = map(string)
}

variable "alert_email" {
  description = "Email address for CloudWatch alarms"
  type        = string
}
