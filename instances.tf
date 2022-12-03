# var token not needed if you use env variable export DIGITALOCEAN_TOKEN="...."
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
 default = "fuzu-mac"
}

data "digitalocean_ssh_key" "ssh_keys" {
  name = var.ssh_key_name
}

# Create the controlplane server
resource "digitalocean_droplet" "controlplane" {
  count = var.controlplane_count
  image  = "ubuntu-20-04-x64"
  name   = "controlplane-${count.index}"
  region = "ams3"
  size   = "s-2vcpu-4gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh_keys.id]
  user_data = file("user-data.sh")
}

# Create the worker node server
resource "digitalocean_droplet" "worker" {
  count = var.worker_count
  image  = "ubuntu-20-04-x64"
  name   = "worker-${count.index}"
  region = "ams3"
  size   = "s-2vcpu-4gb"
  ssh_keys = [data.digitalocean_ssh_key.ssh_keys.id]
  user_data = file("user-data.sh")
}