# ============================================================================
# IAM Module - Roles and Policies for CloudHSM and KMS
# ============================================================================

# IAM Role for CloudHSM Administration
resource "aws_iam_role" "hsm_admin" {
  name = "${var.project_name}-${var.environment}-hsm-admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-${var.environment}-hsm-admin-role"
  }
}

# IAM Policy for CloudHSM Administration
resource "aws_iam_role_policy" "hsm_admin" {
  name = "${var.project_name}-${var.environment}-hsm-admin-policy"
  role = aws_iam_role.hsm_admin.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "cloudhsm:*",
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DetachNetworkInterface",
          "ec2:DeleteNetworkInterface"
        ]
        Resource = "*"
      }
    ]
  })
}

# IAM Role for KMS Key Administration
resource "aws_iam_role" "kms_admin" {
  name = "${var.project_name}-${var.environment}-kms-admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.project_name}-${var.environment}-kms-admin-role"
  }
}

# IAM Policy for KMS Administration
resource "aws_iam_role_policy" "kms_admin" {
  name = "${var.project_name}-${var.environment}-kms-admin-policy"
  role = aws_iam_role.kms_admin.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "kms:Create*",
          "kms:Describe*",
          "kms:Enable*",
          "kms:List*",
          "kms:Put*",
          "kms:Update*",
          "kms:Revoke*",
          "kms:Disable*",
          "kms:Get*",
          "kms:Delete*",
          "kms:ScheduleKeyDeletion",
          "kms:CancelKeyDeletion"
        ]
        Resource = "*"
      }
    ]
  })
}
