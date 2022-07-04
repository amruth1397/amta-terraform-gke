#create subnet inside the VPC using https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "subnetwork-amta"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true

  #Secondary ranges for pods is used to expose pods to external network (outside VPC)
  secondary_ip_range {
    range_name    = "pod-secondary-range-${var.project_id}"
    ip_cidr_range = "192.168.10.0/24"
  }

  secondary_ip_range {
    range_name    = "service-secondary-range-${var.project_id}"
    ip_cidr_range = "192.196.10.0/24"
  }
}
