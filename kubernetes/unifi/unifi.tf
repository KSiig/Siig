data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "unifi" {
  name          = var.unifi_name
  repository    = data.helm_repository.stable.metadata[0].name
  chart         = var.unifi_chart
  version       = var.unifi_version
  namespace     = var.unifi_namespace
  recreate_pods = true

  values = [<<EOF
ingress:
  enabled: true
  annotations:
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
    kubernetes.io/ingress.class: nginx
  hosts:
    - unifi.siig.tech
  path: /
  tls:
    - hosts:
        - unifi.siig.tech
mongodb:
  enabled: true
  databaseName: unifi
persistence:
  existingClaim: pvc-unifi
controllerService:
  type: ClusterIP
podAnnotations:
  linkerd.io/inject: enabled
EOF
  ]

  set_sensitive {
    name  = "mongodb.dbUri"
    value = "mongodb://${var.unifi_mongodb_username}:${replace(random_password.unifi_mongodb_password.result, "@", "%40")}@${var.unifi_mongodb_name}/unifi?authSource=unifi"
  }

  set_sensitive {
    name  = "mongodb.statDbUri"
    value = "mongodb://${var.unifi_mongodb_username}:${replace(random_password.unifi_mongodb_password.result, "@", "%40")}@${var.unifi_mongodb_name}/unifi_stat?authSource=unifi"
  }

  set {
    name  = "mongodb.databaseName"
    value = "unifi"
  }

  depends_on = [helm_release.pvc_unifi]
}
