output "droplet_controleplane_ipv4_address" {
  value = digitalocean_droplet.controlplane[*].ipv4_address
}

output "droplet_worker_ipv4_address" {
  value = digitalocean_droplet.worker[*].ipv4_address
}