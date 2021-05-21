# Deployment Steps

**Init**ialize Terraform

```bash
terraform init
```

Log into Azure

```bash
az login
```

Create a **plan** and follow prompts

```bash
terraform plan
```

Create a **plan** with variables

```bash
terraform plan -var="location=westeurope" -var="resource_group_name=flkelly-terraform-westeurope"
```

Create a **plan** with variables with an output **plan file**

```bash
terraform plan -var="location=westeurope" -var="resource_group_name=flkelly-terraform-westeurope" -out deployRG.plan
```

**Apply** Terrafrom IaC based upon **plan**

```bash
terraform apply "deployRG.plan"
```

**Destroy** Terraform IaC based upon **plan**

```bash
terraform apply -destroy
```
