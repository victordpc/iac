# Rellena las salidas. Sirven para probar la API
#
# Conviene sacar:
# - el DNS del ALB compartido
# - la URL de tu API, con el prefijo /ucm-<id>/
# - el nombre del bucket de CSV
# - el nombre de la base de Glue
# - el nombre de la función Lambda del aviso

# TODO: Descomentar y completar
output "dns_alb" {
  description = "DNS del ALB compartido."
  value       = data.aws_lb.base.dns_name
}

# TODO: Descomentar y completar
output "url_api" {
  description = "URL de tu API, con el prefijo /ucm-<id>/."
  value       = "http://${data.aws_lb.base.dns_name}/ucm-${replace(var.identificador_alumno, "_", "-")}/"
}

# TODO: Descomentar y completar
output "bucket_datos" {
  description = "Nombre del bucket de CSV."
  value       = aws_s3_bucket.datos.bucket
}

# TODO: Descomentar y completar
output "base_athena" {
  description = "Nombre de la base de Glue."
  value       = aws_glue_catalog_database.menus.name
}

# TODO: Descomentar y completar
output "funcion_aviso" {
  description = "Nombre de la función Lambda del aviso."
  value       = aws_lambda_function.aviso.function_name
}
