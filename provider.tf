#Provider used from https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project     = var.project_id
  region      = var.region
}


#Using particular version of from the terraform documentation and Storing state file in gsc as object https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket  = "amta-tf-state"
    prefix  = "terraform/state"
  }

    required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.27.0"
    }
  }
}



