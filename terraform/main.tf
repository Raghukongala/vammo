resource "aws_ecs_cluster" "vammo_cluster" {
  name = var.cluster_name
}

resource "aws_ecs_task_definition" "vammo_task" {
  family                   = var.task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "vammo-container"
      image = var.docker_image
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "vammo_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.vammo_cluster.id
  task_definition = aws_ecs_task_definition.vammo_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["subnet-09e5b30c5c853be42"]
    assign_public_ip = true
  }
}
