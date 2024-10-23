variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://64.255.204.91:8006"  # Default value set here
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  default = "terraform@pam!terrafor_token"
}