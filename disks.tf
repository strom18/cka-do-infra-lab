# # Disks for controlplane
# resource "digitalocean_volume" "rook_controlplan" {
#   count = var.controlplane_count
#   region                  = "ams3"
#   name                    = "rook-controlplane-disk-${count.index}"
#   size                    = var.node_disk_size
# #   initial_filesystem_type = "xfs"
# }

# resource "digitalocean_volume_attachment" "controlplane_attachment" {
#   count = var.controlplane_count
#   droplet_id = digitalocean_droplet.controlplane[count.index].id
#   volume_id  = digitalocean_volume.rook_controlplan[count.index].id
# }

# # Disks for worker node 
# resource "digitalocean_volume" "rook_worker" {
#   count = var.worker_count
#   region                  = "ams3"
#   name                    = "rook-worker-disk-${count.index}"
#   size                    = var.node_disk_size
# #   initial_filesystem_type = "xfs"
# }

# resource "digitalocean_volume_attachment" "worker_attachment" {
#   count = var.worker_count
#   droplet_id = digitalocean_droplet.worker[count.index].id
#   volume_id  = digitalocean_volume.rook_worker[count.index].id
# }