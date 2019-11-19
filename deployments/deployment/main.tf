terraform {
  backend "pg" {
  }
}

provider "kubernetes" {
}

module "deployment" {
  source = "../../modules/deployment"
  # tag            = "go-api-local"

  docker_image = "bamdockerhub/game-abstraction-middleware:0.0.1"
  deployment_name = "last-deployment"
  namespace="go-apis"
  config_file="review.yml"
  config_path="/config/"
}
