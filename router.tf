
#This router can be used with a NAT gateway to connect with subnet with internet https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router
resource "google_compute_router" "router" {
  name    = "router-amta"
  region  = var.region
  network = google_compute_network.vpc_network.id
}