resource "proxmox_vm_qemu" "k3s_nodes" {
  for_each = var.vm_configs

  vmid = each.value.vm_id
  name = each.value.name
  desc = "Managed by Terraform"
  tags = join(",", each.value.tags)
  agent = 1
  target_node = each.value.node
  clone = var.proxmox_clone_template
  full_clone = true
  onboot = true
  automatic_reboot = true 
  qemu_os = "l26"
  bios = "seabios"
  cores = each.value.cores
  sockets = 1
  cpu_type = "host"
  machine = "q35"
  memory = each.value.memory
  network {
    id     = 0 
    bridge = "vmbr0"
    model  = "virtio"
    tag = var.network_tag
  }
  scsihw = "virtio-scsi-single"
  disks {
    ide {
      ide0 {
        cloudinit {
          storage = var.proxmox_cloudinit_storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = var.proxmox_disk_storage
          size = each.value.size
          emulatessd = true
          iothread = true
          replicate = false
        }
      }
    }
  }

  # Cloud-init Configuration
  
  ipconfig0 = "ip=${each.value.ip}/24,gw=${var.gateway_ip}"
  nameserver = var.nameserver_ip
  ciuser = var.ciuser
  cipassword = var.cipassword
  ciupgrade = true
  sshkeys = var.public_ssh_key 
}