variable "unifi_name" {
  description = "Name of unifi release"
  default     = "unifi"
}

variable "unifi_chart" {
  description = "Chart to use for unifi release"
  default     = "stable/unifi"
}

variable "unifi_version" {
  description = "Version of helm chart to use for unifi"
  default     = "0.6.5"
}

variable "unifi_namespace" {
  description = "Namespace to use for unifi release"
  default     = "unifi"
}

variable "unifi_mongodb_name" {
  description = "Name of unifi mongodb release"
  default     = "unifi-mongodb"
}

variable "unifi_mongodb_chart" {
  description = "Chart to use for unifi release"
  default     = "bitnami/mongodb"
}

variable "unifi_mongodb_version" {
  description = "Version of helm chart to use for unifi"
  default     = "7.10.10"
}

variable "unifi_mongodb_namespace" {
  description = "Namespace to use for unifi release"
  default     = "unifi"
}

variable "unifi_mongodb_username" {
  description = "Unifi username for MongoDB"
  default     = "unifi"
}

variable "kubernetes_credentials" {
  description = "Credentials to connect to K8S cluster"
}
