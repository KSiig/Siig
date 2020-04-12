resource "kubernetes_namespace" "ns_ingress" {
  metadata {
    name = "ingress"
  }
}

resource "kubernetes_namespace" "ns_unifi" {
  metadata {
    name = "unifi"
  }
}
