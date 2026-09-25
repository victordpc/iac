# Proyecto de práctica: recomendador de juegos de mesa

Idea tomada de [`IAC.md`](../IAC.md). El objetivo del curso no es construir la aplicación en este repositorio, sino describir y aprovisionar su infraestructura con Terraform.

## Qué tiene que hacer el sistema

1. Consumir la API de BoardGameGeek para obtener información de juegos de mesa.
2. Consumir la API de BoardGameGeek para obtener la información del usuario y los juegos de su biblioteca.
3. Usar IA para recomendar juegos: tanto afines a los gustos ya presentes en la biblioteca como tipologías que el usuario todavía no ha jugado.

## Qué infraestructura va a necesitar

| Necesidad | Pilar | Módulo |
| --- | --- | --- |
| Secretos de la API de BGG y del proveedor de IA, acceso restringido | Seguridad | `security` |
| Servicio que consulta las APIs y genera recomendaciones | Computación | `compute` |
| Biblioteca del usuario, caché de juegos y resultados | Almacenamiento | `storage` |
| Salud del servicio, errores de las APIs y uso | Monitorización | `monitoring` |

## Decisiones pendientes del curso

- Proveedor cloud.
- Si el estado de Terraform se guarda en local o en un backend remoto.
- Cómo se inyectan los secretos sin dejarlos en el repositorio.

Esas decisiones se anotan en [planificación](fases/01-planificacion.md) antes de crear recursos.
