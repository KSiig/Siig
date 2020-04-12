data "helm_repository" "linkerd" {
  name = "linkerd"
  url  = "https://helm.linkerd.io/stable"
}

resource "helm_release" "linkerd" {
  name       = "linkerd"
  repository = data.helm_repository.linkerd.metadata[0].name
  chart      = "linkerd/linkerd2"

  set {
    name  = "global.identityTrustAnchorsPEM"
    value = tls_self_signed_cert.trustanchor_cert.cert_pem
  }

  set {
    name  = "identity.issuer.crtExpiry"
    value = tls_locally_signed_cert.issuer_cert.validity_end_time
  }

  set {
    name  = "identity.issuer.tls.crtPEM"
    value = tls_locally_signed_cert.issuer_cert.cert_pem
  }

  set {
    name  = "identity.issuer.tls.keyPEM"
    value = tls_private_key.issuer_key.private_key_pem
  }
}
