# project-workload

Template de repositório IaC com fluxo Policy as Code integrado.

## Estrutura

```
project-workload/
├── infra/                          # Código Terraform
│   ├── main.tf                     # Recursos do projeto
│   ├── variables.tf                # Declaração de variáveis
│   ├── outputs.tf                  # Outputs
│   ├── providers.tf                # Provider config
│   └── backend.tf                  # S3 backend
├── envs/                           # Variáveis por ambiente
│   ├── sandbox.tfvars
│   ├── non-prd.tfvars
│   └── prd.tfvars
├── .github/workflows/              # 5 workflows CI/CD
│   ├── ci-security-scan.yml        # WF1: Checkov scan
│   ├── ci-skip-detection.yml       # WF2: Detecta skips → cria WIs
│   ├── ci-exemption-gate.yml       # WF3: Gate de aprovação
│   ├── cd-deploy.yml               # WF4: Terraform plan + apply
│   └── cd-post-approval.yml        # WF5: SCP exception
├── .pre-commit-config.yaml         # Hook local (Barreira 1)
└── README.md
```

## Fluxo de branches (D-01)

```
feature/* → develop (sandbox) → non-prd → main (prd)
```

## Setup para developer

```bash
# Instalar pre-commit
pip install pre-commit
pre-commit install

# Clonar repo de policies como sibling
cd ..
git clone https://github.com/org/cloud-policies-check.git
```

## Secrets necessários

| Secret | Descrição |
|--------|-----------|
| POLICIES_TOKEN | PAT read-only para cloud-policies-check |
| ADO_PAT | PAT do Azure DevOps (Work Items R&W) |
| ADO_ORG_URL | https://dev.azure.com/\<org\> |
| ADO_PROJECT | Nome do projeto no ADO |
| AWS_ROLE_ARN_SANDBOX | IAM Role ARN para OIDC (sandbox) |
| AWS_ROLE_ARN_NONPRD | IAM Role ARN para OIDC (non-prd) |
| AWS_ROLE_ARN_PRD | IAM Role ARN para OIDC (prd) |
| ORG_REPO_TOKEN | PAT para aws-organizations-terraform |
