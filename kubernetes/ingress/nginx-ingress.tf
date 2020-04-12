data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "nginx_ingress" {
  name       = var.nginx_ingress_name
  repository = data.helm_repository.stable.metadata[0].name
  chart      = var.nginx_ingress_chart
  version    = var.nginx_ingress_version
  namespace  = var.nginx_ingress_namespace

  values = [<<EOF
serviceAccount:
  name: svca-nginx-ingress
controller:
  podAnnotations:
    linkerd.io/inject: enabled
defaultBackend:
  podAnnotations:
    linkerd.io/inject: enabled
EOF
  ]
}
