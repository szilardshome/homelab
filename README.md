# 🏡 My Homelab Configurations

Hi there!

I'm Szilárd Farkas, and I have a passion for building and tinkering with homelab environments! My enthusiasm lies in setting up and experimenting with various technologies in a home setting. This repository is my personal collection of configuration files for my homelab infrastructure.

**What's Inside?**

In this repository, you'll find my **Terraform** configurations used to manage my home laboratory setup. My primary goal is to automate deployment and management tasks, focusing particularly on virtualization and container orchestration.

Currently, the configurations predominantly focus on:

* **Proxmox VE:** This serves as the foundation of my virtualization environment. The Terraform code here is used for creating and configuring Virtual Machines (VMs).
* **Kubernetes (k3s):** My platform for running containerized applications. I use Terraform to provision and prepare the Proxmox VMs that act as the nodes for the k3s cluster (both masters and workers).

The aim of this repository is to keep these files organized and potentially offer inspiration or a starting point for other homelab enthusiasts. By using Infrastructure as Code (IaC) with Terraform, I can easily version, reproduce, and manage my lab setup efficiently.

**Repository Structure**

You'll find the configuration files organized into folders, typically grouping related components together (e.g., `terraform/proxmox-k3s-cluster` might contain the files for deploying the Kubernetes VMs). Look through the directories to find the specific configurations you're interested in.

**Getting Started / Usage**

These configurations are written for my specific homelab environment. If you wish to adapt and use them yourself, you will likely need to modify the variables (in `.tfvars` files or similar methods) to match your own Proxmox setup, IP addresses, network configuration, and other parameters.

To use these files, you will need:

1.  **Terraform:** Installed on your machine.
2.  **Proxmox Terraform Provider:** Configured to connect to your Proxmox VE instance.
3.  Access to a Proxmox VE environment.

Clone the repository, navigate to the desired configuration directory, update the variables, and run `terraform init`, `terraform plan`, and `terraform apply`.

---

Thanks for stopping by! I hope you find this repository interesting or useful.

Best regards,
Szilárd Farkas