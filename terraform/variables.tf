variable "hcloud_token" {
  type = string
  description = "Hetzner Cloud API Token"
}

variable "ssh_public_key" {
  type = string
  description = "Public SSH Key"
}

variable "ssh_key_name" {
  type = string
  description = "The name of the existing SSH key in Hetzner Cloud"
}
