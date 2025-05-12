# 🏡 My Homelab Configurations

Hi there!

I'm Szilárd Farkas, and I have a passion for building and tinkering with homelab environments! My enthusiasm lies in setting up and experimenting with various technologies in a home setting. This repository is my personal collection of configuration files for my homelab infrastructure.

If you have any questions or are looking for something specific, you can reach me here: szilard.farkas@szilardshome.com

**What's Inside?**

In this repository, you'll find my **Terraform** and **Packer** configurations used to manage my home laboratory setup. My primary goal is to automate deployment and management tasks, focusing particularly on creating base images and orchestrating containers.

Currently, the configurations predominantly focus on:

* **Proxmox VE:** This serves as the foundation of my virtualization environment. The Terraform code here is used for creating and configuring Virtual Machines (VMs). I also use **Packer** to build standardized VM images for Proxmox, ensuring consistency and speed when deploying new systems.
* **Kubernetes (k3s):** My platform for running containerized applications. The Terraform configurations prepare the Proxmox VMs that act as the nodes for the k3s cluster (both masters and workers).
* **1Password:** While not code stored directly here, 1Password is an essential part of my homelab security, used for securely managing secrets, passwords, and sensitive information required by these configurations (like API tokens or user credentials).

The aim of this repository is to keep these files organized and potentially offer inspiration or a starting point for other homelab enthusiasts. By using Infrastructure as Code (IaC) with Terraform and image building with Packer, I can easily version, reproduce, and manage my lab setup efficiently and securely.

**Repository Structure**

You'll find the configuration files organized into folders, typically grouping related components together (e.g., `terraform/proxmox-k3s-cluster` might contain the files for deploying the Kubernetes VMs, and a `packer` directory might hold image-building templates). Look through the directories to find the specific configurations you're interested in.

**Getting Started / Usage**

These configurations are written for my specific homelab environment. If you wish to adapt and use them yourself, you will likely need to modify the variables (in `.tfvars` files or similar methods) to match your own Proxmox setup, IP addresses, network configuration, and other parameters.

To use these files, you will need:

1.  **Terraform:** Installed on your machine.
2.  **Packer:** Installed on your machine (for image building).
3.  **Proxmox Terraform Provider:** Configured to connect to your Proxmox VE instance.
4.  A method for securely managing secrets (like **1Password**) that are referenced by the configurations.
5.  Access to a Proxmox VE environment.

Clone the repository, navigate to the desired configuration directory, update the variables, and run `terraform init`, `terraform plan`, and `terraform apply` (for Terraform) or `packer build` (for Packer templates).

---

Thanks for stopping by! I hope you find this repository interesting or useful.

Best regards,
Szilárd Farkas