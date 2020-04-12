resource "helm_release" "pvc_unifi" {
  name      = "pvc-unifi"
  chart     = "./kubernetes/custom_helm_charts/aks-pvc-0.1.0.tgz"
  namespace = "unifi"

  values = [<<EOF
name: pvc-unifi
EOF
  ]
}

resource "helm_release" "pvc_unifi_mongodb" {
  name      = "pvc-unifi-mongodb"
  chart     = "./kubernetes/custom_helm_charts/aks-pvc-0.1.0.tgz"
  namespace = "unifi"

  values = [<<EOF
name: pvc-unifi-mongodb
EOF
  ]
}
