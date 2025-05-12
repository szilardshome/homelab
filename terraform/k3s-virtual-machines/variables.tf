variable "proxmox_api_url" {
  description = "The URL of the Proxmox API."
  type        = string
}
variable "proxmox_token_id" {
  description = "The Proxmox API token ID (e.g., terraform-prov@pve!mytoken)."
  type        = string
  sensitive   = true
}
variable "proxmox_token_secret" {
  description = "The Proxmox API token secret."
  type        = string
  sensitive   = true
}
variable "ciuser" {
    description = "The user for cloud-init configuration."
    type = string
}
variable "cipassword" {
  description = "The password for the cloud-init user."
  type        = string
  sensitive   = true
}
variable "public_ssh_key" {
  description = "The public SSH key to upload to VMs via cloud-init."
  type        = string
  sensitive   = true 
}
variable "vm_configs" {
  description = "Map of virtual machine configurations."
  type = map (object({
      vm_id = number
      name = string
      cores = number
      memory = number
      size = string
      node = string
      ip     = string 
      tags   = list(string) // Added tags attribute
  }))
}
variable "gateway_ip" {
    description = "The default gateway IP address for the network."
    type = string
}
variable "nameserver_ip" {
    description = "The IP address of the DNS server."
    type = string
}
variable "network_tag" {
    description = "VLAN tag for the network interface."
    type = number
}
variable "proxmox_clone_template" {
    description = "The name of the Proxmox VM template to clone."
    type = string
}
variable "proxmox_cloudinit_storage" {
    description = "The storage pool for the cloud-init drive."
    type = string
}
variable "proxmox_disk_storage" {
    description = "The storage pool for the primary VM disk."
    type = string
}
