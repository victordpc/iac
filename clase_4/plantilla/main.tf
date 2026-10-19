# Target group y regla del listener, ya escritos.
# El log group, el clúster y la task definition se declaran.
# El servicio está comentado.

resource "aws_lb_target_group" "api" {
  name        = "ucm-${replace(var.identificador_alumno, "_", "-")}-tg"
  port        = 8000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.aws_vpc.base.id

  deregistration_delay = 30

  health_check {
    path                = "/ucm-${replace(var.identificador_alumno, "_", "-")}/health"
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 15
  }
}

resource "aws_lb_listener_rule" "api" {
  listener_arn = data.aws_lb_listener.http.arn
  priority     = tonumber(data.aws_ssm_parameter.prioridad.insecure_value)

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api.arn
  }

  condition {
    path_pattern {
      values = [
        "/ucm-${replace(var.identificador_alumno, "_", "-")}",
        "/ucm-${replace(var.identificador_alumno, "_", "-")}/*",
      ]
    }
  }
}

# TODO: Descomentar y completar
# resource "aws_ecs_service" "api" {
#   name            = "" # TODO: Completar
#   cluster         = "" # TODO: Completar
#   task_definition = "" # TODO: Completar
#   desired_count   = var.numero_tareas
#   launch_type     = "FARGATE"
#
#   network_configuration {
#     subnets          = [] # TODO: Completar
#     security_groups  = [] # TODO: Completar
#     assign_public_ip = false
#   }
#
#   load_balancer {
#     target_group_arn = aws_lb_target_group.api.arn
#     container_name   = "fastapi"
#     container_port   = 8000
#   }
#
#   # El target group tiene que estar enganchado al ALB antes de crear el servicio.
#   depends_on = [aws_lb_listener_rule.api]
# }
