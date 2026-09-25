# Aprovisionamiento

Crear la infraestructura con Terraform: red, identidades, cómputo y almacenamiento.

## Dónde se trabaja

Los cambios se aplican desde [`terraform/envs/dev`](../../terraform/envs/dev), componiendo los módulos de [`terraform/modules`](../../terraform/modules).

```bash
cd terraform/envs/dev
terraform init
terraform plan
terraform apply
```

## Apuntes

