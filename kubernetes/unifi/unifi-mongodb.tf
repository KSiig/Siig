data "helm_repository" "bitnami" {
  name = "bitnami"
  url  = "https://charts.bitnami.com/bitnami"
}

resource "helm_release" "unifi_mongodb" {
  name          = var.unifi_mongodb_name
  repository    = data.helm_repository.bitnami.metadata[0].name
  chart         = var.unifi_mongodb_chart
  version       = var.unifi_mongodb_version
  namespace     = var.unifi_mongodb_namespace
  recreate_pods = true

  values = [<<EOF
mongodbUsername: ${var.unifi_mongodb_username}
mongodbDatabase: unifi
persistence:
  existingClaim: pvc-unifi-mongodb
podAnnotations:
  linkerd.io/inject: enabled
EOF
  ]

  set_sensitive {
    name  = "mongodbPassword"
    value = random_password.unifi_mongodb_password.result
  }

  set_sensitive {
    name  = "mongodbRootPassword"
    value = random_password.unifi_mongodb_root_password.result
  }

  depends_on = [helm_release.pvc_unifi_mongodb]
}
