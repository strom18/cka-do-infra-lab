# var token not needed if you use env variable export DIGITALOCEAN_TOKEN="...."
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