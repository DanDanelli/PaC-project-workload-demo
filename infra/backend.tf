terraform {
  backend "s3" {
    # Configuração injetada via -backend-config no pipeline:
    #   bucket         = "tfstate-<env>"
    #   key            = "project-workload/terraform.tfstate"
    #   region         = "us-east-1"
    #   dynamodb_table = "terraform-locks"
    #   encrypt        = true
  }
}
