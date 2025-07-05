terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.44.0"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_ssh_key" "default" {
  name       = "default-key"
  public_key = var.ssh_public_key
}

resource "hcloud_server" "portfolio" {
  name        = "portfolio-server"
  image       = "ubuntu-22.04"
  server_type = "cx21"                      # можно cx11, cx21, cx31 и т.д.
  location    = "nbg1"                      # nbg1, hel1, fsn1

  ssh_keys = [hcloud_ssh_key.default.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  labels = {
    env = "portfolio"
  }
}
