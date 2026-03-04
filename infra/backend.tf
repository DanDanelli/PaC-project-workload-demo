# POC — local state (no remote backend)
# For production, uncomment and configure the S3 backend:
#
# terraform {
#   backend "s3" {
#     bucket         = "pac-tfstate-<account_id>"
#     key            = "workload/<env>/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "pac-tfstate-lock"
#     encrypt        = true
#   }
# }
