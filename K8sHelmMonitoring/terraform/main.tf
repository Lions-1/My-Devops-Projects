locals {
  base_apis = [
    "container.googleapis.com",
    "monitoring.googleapis.com",
    "cloudtrace.googleapis.com",
    "cloudprofiler.googleapis.com"
  ]

  cluster_name = google_container_cluster.my_cluster.name
}



module "enable_google_apis" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 14.0"

  project_id                  = var.gcp_project_id
  disable_services_on_destroy = false

  activate_apis = local.base_apis

}

# Create the cluster
resource "google_container_cluster" "my_cluster" {
  name     = var.name
  location = var.region

  enable_autopilot = true

  # Enabling autopilot requires setting an empty ip_allocation_policy
  ip_allocation_policy {}

  depends_on = [
    module.enable_google_apis
  ]
}

# Get credentials for cluster
module "gcloud" {
  source  = "terraform-google-modules/gcloud/google"
  version = "~> 3.0"

  platform              = "linux"
  additional_components = ["kubectl", "beta"]

  create_cmd_entrypoint = "gcloud"
  create_cmd_body       = "container clusters get-credentials ${local.cluster_name} --zone=${var.region} --project=${var.gcp_project_id}"
}

# Apply kubernetes-manifest configuration using provisionner
resource "null_resource" "apply_deployment" {
  provisioner "local-exec" {
    interpreter = ["bash", "-exc"]
    command     = "kubectl apply -k ${var.filepath_manifest} -n ${var.namespace}"
  }

  depends_on = [
    module.gcloud
  ]
}

# Waiting for Pods  to ready up
resource "null_resource" "wait_conditions" {
  provisioner "local-exec" {
    interpreter = ["bash", "-exc"]
    command     = <<-EOT
      kubectl wait --for=condition=ready pods --all -n ${var.namespace} --timeout=280s
    EOT
  }

  depends_on = [
    null_resource.apply_deployment
  ]
}
