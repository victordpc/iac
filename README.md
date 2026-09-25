# IaC con Terraform

Repositorio del curso de infraestructura como código, centrado en Terraform. Los apuntes en bruto están en [`IAC.md`](IAC.md). La documentación ordenada y el código viven aparte para poder ampliar los apuntes sin perder el original.

## Mapa del repositorio

| Ruta | Para qué sirve |
| --- | --- |
| [`IAC.md`](IAC.md) | Apuntes originales del curso |
| [`docs/`](docs/indice.md) | Índice, fases del ciclo de vida y el proyecto de práctica |
| [`terraform/envs/dev`](terraform/envs/dev) | Entorno de desarrollo: aquí se ejecuta Terraform |
| [`terraform/modules`](terraform/modules) | Módulos reutilizables (seguridad, cómputo, almacenamiento, monitorización) |

## Proyecto de práctica

El curso se aplica sobre un recomendador de juegos de mesa: consulta la API de [BoardGameGeek](https://boardgamegeek.com/wiki/page/BGG_XML_API2) y usa IA para proponer juegos a partir de la biblioteca del usuario. El detalle está en [`docs/proyecto.md`](docs/proyecto.md).

## Cómo trabajar en local

Desde el entorno de desarrollo:

```bash
cd terraform/envs/dev
terraform fmt -recursive
terraform init
terraform validate
```

El esqueleto aún no declara proveedor ni recursos. El proveedor (AWS, Azure, GCP u otro) se fija cuando el curso lo concrete, en `terraform/envs/dev/versions.tf`.

## Fases

El ciclo de vida de los apuntes está repartido en [`docs/fases`](docs/indice.md): planificación, aprovisionamiento, configuración, despliegue, monitorización, mantenimiento y eliminación.
