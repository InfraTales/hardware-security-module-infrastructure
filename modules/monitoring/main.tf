# ============================================================================
# Monitoring Module - CloudWatch for CloudHSM and KMS
# ============================================================================

# Data source for current region
data "aws_region" "current" {}

# SNS Topic for Alerts
resource "aws_sns_topic" "alerts" {
  name = "${var.project_name}-${var.environment}-hsm-alerts"

  tags = {
    Name = "${var.project_name}-${var.environment}-hsm-alerts"
  }
}

# SNS Topic Subscription
resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.project_name}-${var.environment}-hsm-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        properties = {
          metrics = [
            ["AWS/CloudHSM", "NumberOfUsers", { stat = "Average" }]
          ]
          period = 300
          stat   = "Average"
          region = data.aws_region.current.name
          title  = "CloudHSM Active Users"
        }
      },
      {
        type = "metric"
        properties = {
          metrics = [
            ["AWS/KMS", "NumberOfRequests", { stat = "Sum" }]
          ]
          period = 300
          stat   = "Sum"
          region = data.aws_region.current.name
          title  = "KMS API Requests"
        }
      }
    ]
  })
}

# CloudWatch Log Group for CloudHSM
resource "aws_cloudwatch_log_group" "cloudhsm" {
  name              = "/aws/cloudhsm/${var.project_name}-${var.environment}"
  retention_in_days = 30

  tags = {
    Name = "${var.project_name}-${var.environment}-cloudhsm-logs"
  }
}
