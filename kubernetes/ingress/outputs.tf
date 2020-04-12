data "kubernetes_service" "nginx_ingress" {
  metadata {
    name      = "${helm_release.nginx_ingress.name}-controller"
    namespace = helm_release.nginx_ingress.namespace
  }
}

output "nginx_ingress_ip" {
  value = data.kubernetes_service.nginx_ingress.load_balancer_ingress.0.ip
}
