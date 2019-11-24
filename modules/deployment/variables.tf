variable "docker_image" {
  default = "bamdockerhub/game-abstraction-middleware:0.0.2"
}

variable "deployment_name" {
  default = "last-deployment"
}

variable "namespace" {
  default = "go-apis"
}

variable "config_file" {
  default = "review.yml"
}

variable "config_path" {
  default = "/config/"
}