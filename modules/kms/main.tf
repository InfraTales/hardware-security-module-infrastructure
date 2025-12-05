# ============================================================================
# KMS Module - Customer Managed Keys
# ============================================================================

# KMS Key for General Encryption
resource "aws_kms_key" "general" {
  description             = "${var.project_name}-${var.environment} General Encryption Key"
  deletion_window_in_days = 30
  enable_key_rotation     = var.enable_key_rotation
  multi_region            = false

  tags = {
    Name = "${var.project_name}-${var.environment}-general-key"
    Purpose = "General Encryption"
  }
}

# KMS Alias for General Key
resource "aws_kms_alias" "general" {
  name          = "alias/${var.project_name}-${var.environment}-general"
  target_key_id = aws_kms_key.general.key_id
}

# KMS Key for Database Encryption
resource "aws_kms_key" "database" {
  description             = "${var.project_name}-${var.environment} Database Encryption Key"
  deletion_window_in_days = 30
  enable_key_rotation     = var.enable_key_rotation

  tags = {
    Name = "${var.project_name}-${var.environment}-database-key"
    Purpose = "Database Encryption"
  }
}

# KMS Alias for Database Key
resource "aws_kms_alias" "database" {
  name          = "alias/${var.project_name}-${var.environment}-database"
  target_key_id = aws_kms_key.database.key_id
}

# KMS Key for S3 Encryption
resource "aws_kms_key" "s3" {
  description             = "${var.project_name}-${var.environment} S3 Encryption Key"
  deletion_window_in_days = 30
  enable_key_rotation     = var.enable_key_rotation

  tags = {
    Name = "${var.project_name}-${var.environment}-s3-key"
    Purpose = "S3 Encryption"
  }
}

# KMS Alias for S3 Key
resource "aws_kms_alias" "s3" {
  name          = "alias/${var.project_name}-${var.environment}-s3"
  target_key_id = aws_kms_key.s3.key_id
}
