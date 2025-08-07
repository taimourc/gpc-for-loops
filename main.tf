resource "google_storage_bucket" "buckets" {
  count         = length(var.bucket_names)
  name          = var.bucket_names[count.index]
  location      = var.bucket_location
  force_destroy = var.force_destroy
  uniform_bucket_level_access = var.uniform_bucket_level_access
}

resource "google_compute_instance" "vms" {
  for_each = var.vm_configs

  name         = each.key
  machine_type = each.value.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = each.value.image
      size  = each.value.disk_size
      type  = each.value.disk_type
    }
  }

  network_interface {
    network       = var.network
    subnetwork    = var.subnetwork
    access_config {}
  }

  metadata = each.value.metadata
  tags     = each.value.tags
}
resource "aws_db_instance" "rds_db" {
  # Only placeholder values needed for import
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  username             = "fake"
  password             = "fakepassword123!"
  skip_final_snapshot  = true
}
