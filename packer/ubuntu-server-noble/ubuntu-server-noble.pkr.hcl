# Packer Template to create an Ubuntu Server (Noble 24.04.2) on Proxmox

# Variable Definitions
variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}
variable "ssh_key_path" {
    type = string
    sensitive = true
}
variable "ubuntu_password" {
    type = string
    sensitive = true
}
variable "ubuntu_username" {
    type = string
    sensitive = true
}

source "proxmox-iso" "ubuntu-server-noble" {

    proxmox_url = "${var.proxmox_api_url}"
    username = "${var.proxmox_api_token_id}"
    token = "${var.proxmox_api_token_secret}"
    insecure_skip_tls_verify = true

    node = "pve2"
    vm_id = "9999"
    vm_name = "k3s-master-template"
    template_description = "Template for Ubuntu Server Noble"

    # (Option 1) Local ISO File
    # iso_file = "local:iso/ubuntu-24.04-live-server-amd64.iso"
    # (Option 2) Download ISO
    iso_url = "https://releases.ubuntu.com/noble/ubuntu-24.04.2-live-server-amd64.iso"

    iso_checksum = "d6dab0c3a657988501b4bd76f1297c053df710e06e0c3aece60dead24f270b4d"
    iso_storage_pool = "shared"
    unmount_iso = true

    # VM System Settings
    qemu_agent = true

    # VM Hard Disk Settings
    scsi_controller = "virtio-scsi-pci"

    disks {
        disk_size = "15G"
        format = "raw"
        storage_pool = "shared"
        storage_pool_type = "lvm"
        type = "scsi"
        ssd = "true"
    }

    # VM CPU Settings
    cpu_type = "host"
    cores = "4"

    # VM Memory Settings
    memory = "8192"

    # VM Network Settings
    network_adapters {
        model = "virtio"
        bridge = "vmbr0"
        vlan_tag = "4"
        firewall = "false"
    }

    # VM Cloud-Init Settings
    cloud_init = true
    cloud_init_storage_pool = "shared"

    # PACKER Boot Commands
    boot_command = [
        "<esc><wait>",
        "e<wait>",
        "<down><down><down><end>",
        "<bs><bs><bs><bs><wait>",
        "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
        "<f10><wait>"
    ]

    boot                    = "c"
    boot_wait               = "10s"
    communicator            = "ssh"

    # PACKER Autoinstall Settings
    http_directory          = "http"
    # (Optional) Bind IP Address and Port
    http_bind_address       = "10.10.10.3"
    http_port_min           = 8802
    http_port_max           = 8802

    ssh_username            = "${var.ubuntu_username}"

    # (Option 1) Add your Password here
    ssh_password        = "${var.ubuntu_password}"
    # - or -
    # (Option 2) Add your Private SSH KEY file here
    ssh_private_key_file    = "${var.ssh_key_path}"

    # Raise the timeout, when installation takes longer
    ssh_timeout             = "30m"
    ssh_pty                 = true
}

# Build Definition to create the VM Template
build {

    name = "ubuntu-server-noble"
    sources = ["source.proxmox-iso.ubuntu-server-noble"]

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #1
    provisioner "shell" {
        inline = [
            "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
            "sudo rm /etc/ssh/ssh_host_*",
            "sudo truncate -s 0 /etc/machine-id",
            "sudo apt -y autoremove --purge",
            "sudo apt -y clean",
            "sudo apt -y autoclean",
            "sudo cloud-init clean",
            "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
            "sudo rm -f /etc/netplan/00-installer-config.yaml",
            "sudo sync"
        ]
    }

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #2
    provisioner "file" {
        source = "files/99-pve.cfg"
        destination = "/tmp/99-pve.cfg"
    }

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #3
    provisioner "shell" {
        inline = [ "sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg" ]
    }
}