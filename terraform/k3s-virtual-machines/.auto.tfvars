ciuser = "ubuntu"

vm_configs = {
  "k3s-master-1" = { vm_id = 4001, name = "k3s-master-1", cores = 4, memory = 8192, node = "pve1", size = "30G", ip = "10.10.4.11", tags = ["green", "red"] }
  "k3s-master-2" = { vm_id = 4002, name = "k3s-master-2", cores = 4, memory = 8192, node = "pve2", size = "30G", ip = "10.10.4.12", tags = ["green", "red"] }
  "k3s-master-3" = { vm_id = 4003, name = "k3s-master-3", cores = 4, memory = 8192, node = "pve3", size = "30G", ip = "10.10.4.13", tags = ["green", "red"] }
  "k3s-worker-1" = { vm_id = 5001, name = "k3s-worker-1", cores = 8, memory = 32768, node = "pve1", size = "300G", ip = "10.10.4.21", tags = ["green", "blue"] }
  "k3s-worker-2" = { vm_id = 5002, name = "k3s-worker-2", cores = 8, memory = 32768, node = "pve2", size = "300G", ip = "10.10.4.22", tags = ["green", "blue"] }
  "k3s-worker-3" = { vm_id = 5003, name = "k3s-worker-3", cores = 8, memory = 32768, node = "pve3", size = "300G", ip = "10.10.4.23", tags = ["green", "blue"] }
}

gateway_ip                  = "10.10.4.1"
nameserver_ip               = "10.10.1.1"
network_tag                 = 4
proxmox_clone_template      = "k3s-master-template"
proxmox_cloudinit_storage   = "local-lvm"
proxmox_disk_storage        = "local-lvm"
