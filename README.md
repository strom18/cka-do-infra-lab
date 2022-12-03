# CKA DigitalOcean infra build

This repo will create a simple infrastructure to work with kubeadm and kubernetes cluster.
You can define the number of controlplane and worker node inside the `instances.tf` files.

```
variable "controlplane_count" {
  default = 1
  description = "Number of controlplane to create"
}

variable "worker_count" {
  default = 1
  description = "Number of worker node to create"
}
```

The shell script `user-data.sh` will install all the requierment to create a kubernetes cluster. You only need to create your first cluster with `kubeadm init`

## Extra

You can uncomment all the line inside the `disks.tf` file if you want to works with distributed storage like rook.io, longhorn, portworx, etc...
It will automatically create a 20GB disks and attach it to the instance. 