# GENERA EL RECURSO DE LA BUCKET S3
resource "aws_s3_bucket" "resource_bucket" {
  bucket = local.nombre_bucket

  tags = {
    Name        = local.nombre_bucket
    Environment = "Dev"
  }
}