# Terraform

Estructura por entornos y módulos. El código se ejecuta siempre desde un entorno, nunca desde la raíz de `terraform/` ni desde un módulo suelto.

```text
terraform/
├── envs/
│   └── dev/          # raíz de Terraform del entorno de desarrollo
└── modules/
    ├── security/     # identidades, acceso y secretos
    ├── compute/      # servicio del recomendador
    ├── storage/      # biblioteca, caché y resultados
    └── monitoring/   # alertas y registros
```

## Convenciones

- Un módulo no fija el proveedor cloud. Eso se declara en el entorno.
- Las salidas de un módulo son la única interfaz que consume el entorno.
- No se commitean estados, `.terraform/` ni ficheros `*.tfvars`.
- El fichero de bloqueo (`.terraform.lock.hcl`) sí se commitea cuando exista, para fijar las versiones de los proveedores.

## Entorno de desarrollo

```bash
cd terraform/envs/dev
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```
