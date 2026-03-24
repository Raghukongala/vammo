variable "cluster_name" {
  default = "vammo-cluster"
}

variable "service_name" {
  default = "vammo-service"
}

variable "task_family" {
  default = "vammo-task"
}

variable "docker_image" {
  default = "raghu282/vammo-app:latest"
}
