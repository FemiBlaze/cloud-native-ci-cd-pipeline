resource "aws_ecr_repository" "app" {
    name = var.app_name

    lifecycle {
        prevent_destroy = true
    }
}
