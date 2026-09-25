# Eliminación

Dar de baja el entorno cuando deje de hacer falta, para no dejar recursos ni coste.

```bash
cd terraform/envs/dev
terraform plan -destroy
terraform destroy
```

## Apuntes

- Orden de borrado si hay datos que conviene exportar antes.
- Qué recursos no debe tocar un `destroy` de `dev` (por ejemplo, un backend remoto de estado compartido).
