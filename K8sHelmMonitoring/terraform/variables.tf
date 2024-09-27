
variable "gcp_project_id" {
  type        = string
  description = "The GCP project ID to apply this config to"
}

variable "name" {
  type        = string
  description = "Name given to the new GKE cluster"
  default     = "online-boutique"
}

variable "region" {
  type        = string
  description = "Region of the new GKE cluster"
  default     = "eu-west1"
}

variable "filepath_manifest" {
  type        = string
  description = "Path to manifests"
  default     = "../microservices/config.yaml"
}
variable "namespace" {
  type        = string
  description = "Kubernetes Namespace in which the Online Boutique resources are to be deployed"
  default     = "OnlineShop"
}

