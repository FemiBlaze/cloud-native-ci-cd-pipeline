resource "aws_ecr_repository" "app" {
    name = var.app_name
    force_delete = true

    # lifecycle {
        # prevent_destroy = false
    # }
}
