# Sigue el README. Los recursos de este laboratorio se declaran aquí.

data "aws_iam_role" "lambda" {
  name = "ucm-lambda-reloj"
}

resource "aws_sns_topic" "reloj" {
  name = replace("${var.identificador_alumno}-topic-reloj", "_", "-")
}

resource "aws_sns_topic_subscription" "correo" {
  for_each  = toset(var.correos)
  topic_arn = aws_sns_topic.reloj.arn
  protocol  = "email"
  endpoint  = each.value
}

locals {
  output_path = "${path.module}/reloj.zip"
}

data "archive_file" "reloj" {
  type        = "zip"
  output_path = local.output_path
  source_file = "${path.module}/src/reloj/lambda_function.py"
}

# Lambda function
resource "aws_lambda_function" "reloj" {
  filename         = local.output_path
  function_name    = replace("${var.identificador_alumno}-reloj", "_", "-")
  role             = data.aws_iam_role.lambda.arn
  handler          = "lambda_function.lambda_handler"
  source_code_hash = data.archive_file.reloj.output_base64sha256


  runtime = "python3.12"

  environment {
    variables = {
      SNS_TOPIC_ARN        = aws_sns_topic.reloj.arn
      IDENTIFICADOR_ALUMNO = replace("${var.identificador_alumno}", "_", "-")
    }
  }
}

resource "aws_cloudwatch_event_rule" "reloj" {
  name                = aws_lambda_function.reloj.function_name
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "reloj" {
  rule = aws_cloudwatch_event_rule.reloj.name
  arn  = aws_lambda_function.reloj.arn
}

resource "aws_lambda_permission" "reloj" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.reloj.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.reloj.arn
}