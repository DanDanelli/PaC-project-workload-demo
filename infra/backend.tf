# POC — state local (sem backend remoto)
# Para produção, descomentar e configurar o backend S3:
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
