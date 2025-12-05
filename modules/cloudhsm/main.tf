# ============================================================================
# CloudHSM Module
# ============================================================================

# Security Group for CloudHSM
resource "aws_security_group" "cloudhsm" {
  name        = "${var.project_name}-${var.environment}-cloudhsm-sg"
  description = "Security group for CloudHSM cluster"
  vpc_id      = var.vpc_id

  # CloudHSM requires port 2223-2225 for cluster communication
  ingress {
    description = "CloudHSM cluster communication"
    from_port   = 2223
    to_port     = 2225
    protocol    = "tcp"
    self        = true
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-cloudhsm-sg"
  }
}

# CloudHSM Cluster
resource "aws_cloudhsm_v2_cluster" "main" {
  hsm_type   = var.hsm_instance_type
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-hsm-cluster"
  }
}

# CloudHSM HSM Instance (at least one required)
resource "aws_cloudhsm_v2_hsm" "main" {
  count      = length(var.private_subnet_ids)
  cluster_id = aws_cloudhsm_v2_cluster.main.id
  subnet_id  = var.private_subnet_ids[count.index]

  # Note: In production, you would initialize the HSM after creation
  # This requires manual steps or custom provisioning
}
