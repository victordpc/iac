variable "identificador_alumno" {
  type = string
  default = "victordelpino"
}

variable "nombre_proyecto" {
  type = string
  default = "microcredencial_ucm"
}
locals {
  nombre_bucket = replace("ucm-${var.identificador_alumno}-${var.nombre_proyecto}", "_", "-")
}