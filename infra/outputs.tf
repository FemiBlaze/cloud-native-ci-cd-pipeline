output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.app.repository_url
}

output "load_balancer_dns" {
  description = "Public URL of the app"
  value       = aws_lb.app_lb.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}

output "task_definition_family" {
  value = aws_ecs_task_definition.app.family
}
output "app_url" {
  description = "The URL to access the application"
  value       = "http://${aws_lb.app_lb.dns_name}"
}