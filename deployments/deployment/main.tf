terraform {
  backend "pg" {
    workspaces {
      name = "go-apis"
    }
  }
}

provider "kubernetes" {
}

module "deployment" {
  source = "../../modules/deployment"

  docker_image = "patches12345/hope"
  deployment_name = "last-deployment"
  namespace="go-apis"
}
