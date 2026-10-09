# GENERA EL RECURSO DE LA BUCKET S3
locals {
  nombre_bucket = replace("ucm-${var.identificador_alumno}-${var.nombre_proyecto}", "_", "-")
}
resource "aws_s3_bucket" "resource_bucket" {
  bucket = local.nombre_bucket

  tags = {
    Name        = local.nombre_bucket
    Environment = "Dev"
  }
}