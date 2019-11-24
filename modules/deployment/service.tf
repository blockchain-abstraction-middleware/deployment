resource "kubernetes_service" "main" {
  metadata {
    name = "${var.deployment_name}"
    namespace = "${var.namespace}"
  }
  spec {
    selector = {
      app = "${var.deployment_name}"
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 8080
    }
  }
}