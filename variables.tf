variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "bucket_names" {
  type = list(string)
}

variable "bucket_location" {
  type = string
}

variable "force_destroy" {
  type    = bool
  default = true
}

variable "uniform_bucket_level_access" {
  type    = bool
  default = true
}

variable "network" {
  type = string
}

variable "subnetwork" {
  type = string
}

variable "vm_configs" {
  type = map(object({
    machine_type = string
    image        = string
    disk_size    = number
    disk_type    = string
    metadata     = map(string)
    tags         = list(string)
  }))
}