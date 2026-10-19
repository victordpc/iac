# Sigue el README. Los recursos de este laboratorio se declaran aquí.

data "aws_iam_role" "lambda" {
  name = "ucm-lambda-reloj"
}

resource "aws_sns_topic" "reloj" {
  name = replace("${var.identificador_alumno}-reloj", "_", "-")
}

resource "aws_sns_topic_subscription" "correo" {
  for_each  = toset(var.correos)
    topic_arn = aws_sns_topic.reloj.arn
    protocol  = "email"
    endpoint  = each.value
}
