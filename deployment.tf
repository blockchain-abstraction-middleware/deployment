resource "kubernetes_namespace" "hhh" {
  metadata {
    annotations = {
      name = "${var.namespace}"
    }

    labels = {
      mylabel = "${var.namespace}"
    }

    name = "${var.namespace}"
  }
}

resource "kubernetes_deployment" "new_app" {
  metadata {
    name = "${var.deployment_name}"
    namespace = "${var.namespace}"
    labels = {
      test = "${var.deployment_name}"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = "${var.deployment_name}"
      }
    }

    template {
      metadata {
        labels = {
          test = "${var.deployment_name}"
        }
      }

      spec {
        container {
          image = "${var.docker_image}"
          name  = "${var.deployment_name}"
        }
      }
    }
  }
}
output "ip_address" {
  value = "${kubernetes_deployment.new_app.id}"
}