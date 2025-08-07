provider "google" {
  project = var.project_id
  region  = var.region
}
provider "aws" {
  region = "us-east-2a"
}
