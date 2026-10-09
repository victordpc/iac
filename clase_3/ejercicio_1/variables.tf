variable "correos" {
  description = "Correos que reciben el mensaje del reloj. Incluye el tuyo y el del profesor."
  type        = list(string)
  default     = ["victor.delpino@bluetab.net", "juan.marino@bluetab.net"]
}

variable "identificador_alumno" {
  description = "Identificador del alumno, en minúsculas. Entra en el nombre de la función, del topic y de la regla."
  type        = string
  default     = "ucm-victor-delpino"
}
