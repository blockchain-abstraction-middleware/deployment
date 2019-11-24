resource "kubernetes_deployment" "main" {
  metadata {
    name = "${var.deployment_name}"
    namespace = "${var.namespace}"
    labels = {
      app = "${var.deployment_name}"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "${var.deployment_name}"
      }
    }

    template {
      metadata {
        labels = {
          app = "${var.deployment_name}"
        }
      }

      spec {
        volume {
          
          name = "secret-key"

          secret {
            secret_name = "secret-key"
          }
        }

        container {
          image = "${var.docker_image}"
          name  = "${var.deployment_name}"

          volume_mount {
            name = "secret-key"
            mount_path = ".secret-key/"
          }

          env {
            name="CONFIG_PATH"
            value="${var.config_path}"
          }

          env {
            name="CONFIG_FILE"
            value="${var.config_file}"
          }
        }
      }
    } 
  }
}