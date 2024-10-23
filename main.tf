terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}
#Configure ProxMox API user/permissions and API url
#provider "proxmox" {
  #pm_api_url           = var.pm_api_url
#  pm_api_token_id      = var.pm_api_token_id
#  pm_api_token_secret  = var.pm_api_token_secret
#  pm_tls_insecure      = true
#}
# Data source to fetch information
resource "proxmox_vm_qemu" "test_vm" {
  name        = "terraform-test-vm"
  target_node = "pve" # Replace with your Proxmox node
  vmid        = 9210
  clone       = "121"
 # os_type     = "cloud-init"
  cores       = 2
  memory      = 1024
  disk {
    size = "10G"
  }
  network {
    model = "virtio"
    bridge = "vmbr0"            # Use your network bridge name
    tag    = 150                # VLAN ID 150
  }
}