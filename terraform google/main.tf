terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.2.0"
    }
  }
}


provider "google" {
  credentials = "./keys/my-cred.json"
  project     = "striped-guard-302513"
  region      = "us-central1"
}

resource "google_storage_bucket" "water-bucket-london-jo" {
  name          = "bucket-of-water-london-jo"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "water-bigquery-london-jo" {
  dataset_id = "waterbucketlondonjo"
  location   = "US"
}