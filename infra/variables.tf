variable "aws_region" {   
    description = "The AWS region to deploy resources in"
    type        = string
    default     = "eu-west-1"
}
variable "app_name" {
    description = "The name of the application to deploy"
    type        = string
    default     = "foodie-app"
}
variable "container_port" {
    description = "The port on which the container listens"
    type        = number
    default     = 80
}
variable "cpu" {
    description = "The number of CPU units to allocate for the task"
    type        = number
    default     = 256
}
variable "memory" {
    description = "The amount of memory (in MiB) to allocate for the task"
    type        = number
    default     = 512
}