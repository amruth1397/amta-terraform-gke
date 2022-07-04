# Used to select services to work with https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}


resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = "vpc-network-amta"
  auto_create_subnetworks = false
  mtu                     = 1460
  delete_default_routes_on_create = false

  depends_on = [ google_project_service.compute, google_project_service.container ]
}



