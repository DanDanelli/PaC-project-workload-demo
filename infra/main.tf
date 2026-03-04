# ─────────────────────────────────────────────────
# project-workload/infra/main.tf
# Exemplo de recurso IaC para demonstrar o fluxo
# Policy as Code com Checkov.
# ─────────────────────────────────────────────────

locals {
  common_tags = {
    Environment = var.environment
    Owner       = var.owner
    Project     = var.project_name
    CostCenter  = var.cost_center
    ManagedBy   = "terraform"
  }
}

# Exemplo: S3 bucket non-compliant com as policies
# resource "aws_s3_bucket_public_access_block" "example" {
#   bucket = aws_s3_bucket.example.id
 
#   block_public_acls       = false   # <-- viola CKV_CUSTOM_002
#   block_public_policy     = false
#   restrict_public_buckets = false
#   ignore_public_acls      = false
# }

# Exemplo: S3 bucket compliant com as policies
resource "aws_s3_bucket" "app_data" {
  bucket = "${var.project_name}-${var.environment}-app-data"
  tags   = local.common_tags
}

resource "aws_s3_bucket_versioning" "app_data" {
  bucket = aws_s3_bucket.app_data.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_data" {
  bucket = aws_s3_bucket.app_data.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "app_data" {
  bucket                  = aws_s3_bucket.app_data.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "app_data" {
  bucket        = aws_s3_bucket.app_data.id
  target_bucket = aws_s3_bucket.app_data.id
  target_prefix = "logs/"
}
