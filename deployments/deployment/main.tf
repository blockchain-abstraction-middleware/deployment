terraform {
  backend "pg" {
  }
}

provider "kubernetes" {
}

module "deployment" {
  source          = "../../modules/deployment"
  docker_image    = "bamdockerhub/game-abstraction-middleware:0.0.2"
  deployment_name = "first-deployment"
  namespace       = "go-apis"
  config_file     = "review.yml"
  config_path     = "/config/"
}
