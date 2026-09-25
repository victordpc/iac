variable "environment" {
  description = "Nombre del entorno. Identifica recursos y evita mezclar dev con otros entornos."
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Nombre corto del proyecto, usado como prefijo de los recursos."
  type        = string
  default     = "bgg-recommender"
}
