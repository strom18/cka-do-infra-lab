terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  # Uncomment token line is you don't use env var DIGITALOCEAN_TOKEN
  token = var.do_token
}