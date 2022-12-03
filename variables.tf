variable "do_token" {
    description = "The API token provide by DigitalOcean"
}

variable "controlplane_count" {
  default = 1
  description = "Number of controlplane to create"
}

variable "worker_count" {
  default = 1
  description = "Number of worker node to create"
}

variable "ssh_key_name" {
 description = "Add your ssh key name create on DigitalOcean"
 # You can add your ssh key name here
 # default = "f"
}

variable "node_disk_size" {
  default = 20
}
