# GENERA EL RECURSO DE LA BUCKET S3
resource "aws_s3_bucket" "resource_bucket" {
  bucket = "my-bucket-${random_integer.random_bucket_name.result}"

  tags = {
    Name        = "My bucket-${random_integer.random_bucket_name.result}"
    Environment = "Dev"
  }
}

resource "random_integer" "random_bucket_name" {
  min = 1
  max = 100
}