variable "nginx_ingress_name" {
  description = "Name of nginx-ingress release"
  default     = "nginx-ingress"
}

variable "nginx_ingress_chart" {
  description = "Chart to use for nginx-ingress release"
  default     = "stable/nginx-ingress"
}

variable "nginx_ingress_version" {
  description = "Version of helm chart to use for nginx-ingress"
  default     = "1.36.0"
}

variable "nginx_ingress_namespace" {
  description = "Namespace to use for nginx-ingress release"
  default     = "ingress"
}
