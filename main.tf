terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}
#Configure ProxMox API user/permissions and API url
provider "proxmox" {
  pm_api_url           = var.pm_api_url
  pm_api_token_id      = var.pm_api_token_id
  pm_api_token_secret  = var.pm_api_token_secret
  pm_tls_insecure      = true
}
# Data source to fetch information
data "proxmox_nodes" "all" {}

# Output the list of available Proxmox nodes
output "proxmox_nodes" {
  value = data.proxmox_nodes.all.names
}