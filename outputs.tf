output "bucket_names" {
  value = [for b in google_storage_bucket.buckets : b.name]
}

output "vm_names" {
  value = [for vm in google_compute_instance.vms : vm.name]
}