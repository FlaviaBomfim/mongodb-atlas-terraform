# Gerenciando MongoDB Atlas com Terraform

Este repositório contém exemplos práticos e passo a passo completo para gerenciar clusters MongoDB Atlas utilizando Terraform.

## O que é Terraform?

Terraform é uma ferramenta open-source desenvolvida pela HashiCorp que permite gerenciar toda sua infraestrutura por código (IaC - Infraestrutura como Código). 

### Vantagens do Terraform:

- Automação: Reduz tarefas manuais repetitivas.
- Consistência: Garante ambientes padronizados.
- Controle de Versão: Possibilita rastrear alterações com ferramentas como Git.

## O que é MongoDB Atlas?

É um serviço gerenciado do MongoDB na nuvem que oferece:

- Escalabilidade automática
- Alta disponibilidade
- Segurança integrada
- Backups automatizados

## Estrutura do projeto

```bash
mongodb-atlas-terraform/
├── provider.tf
├── cluster.tf
├── import.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
└── README.md
```

## Requisitos

- [Terraform instalado](https://developer.hashicorp.com/terraform/downloads)
- Conta gratuita no [MongoDB Atlas](https://cloud.mongodb.com/)

## Como executar passo a passo

### 1. Clone o repositório

```bash
git clone https://github.com/<seu-usuario>/mongodb-terraform-demo.git
cd mongodb-terraform-demo
```

### 2. Configure suas credenciais

Copie o arquivo `terraform.tfvars.example` e adicione suas chaves reais:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Exemplo do arquivo:

```hcl
atlas_public_key  = "<sua-chave-publica>"
atlas_private_key = "<sua-chave-privada>"
project_id        = "<id-do-seu-projeto>"
```

### 3. Inicialize o Terraform

```bash
terraform init
```

### 4. Valide as configurações antes de criar

```bash
terraform plan
```

### 5. Crie o Cluster MongoDB Atlas

```bash
terraform apply
```

Confirme com `yes` para executar.

### 6. Importar um Cluster Existente

Se você já criou um cluster diretamente no painel do Atlas e deseja gerenciá-lo com Terraform, utilize o comando abaixo para importar:

```bash
terraform import mongodbatlas_cluster.cluster_import PROJECT_ID-CLUSTER_NAME
```

Exemplo prático:

```bash
terraform import mongodbatlas_cluster.cluster_import 65e7f37e123456789abcdef0-ClusterExistente
```

Exemplo mínimo necessário em `import.tf`:

```hcl
resource "mongodbatlas_cluster" "cluster_import" {
  project_id                  = var.project_id
  name                        = "ClusterExistente"
  provider_name               = "AWS"
  provider_region_name        = "US_EAST_1"
  provider_instance_size_name = "M10"
}
```

Após importar, valide com:

```bash
terraform plan
```

## Atenção com arquivos sensíveis

Adicione um arquivo `.gitignore` para não expor arquivos sensíveis no seu repositório:

```gitignore
terraform.tfvars
*.tfstate
*.tfstate.*
.terraform/
```

## Melhores práticas

- Separe claramente seus arquivos Terraform (`.tf`).
- Utilize módulos para reaproveitar código.
- Proteja suas credenciais e utilize variáveis sensíveis.
- Versione sua infraestrutura usando Git.

## Referências Oficiais

- [Terraform MongoDB Atlas Provider](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs)
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)

---