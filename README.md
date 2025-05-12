# 🏡 My Homelab Configurations

👋 Hi there!

I'm Farkas Szilárd , and I have a huge passion for the **homelab** world! ❤️ My enthusiasm lies in building and experimenting with various technologies in a home setting. This repository is my personal collection of configuration files for my homelab infrastructure.

If you have any questions or are looking for something specific, feel free to reach out: 📧 szilard.farkas@szilardshome.com

---

✨ **What's Inside?**

In this repository, you'll find my **Terraform** and **Packer** configurations used to manage my home laboratory setup. My main goal is to **automate** deployment and management tasks following **Infrastructure as Code (IaC)** principles.

Currently, the configurations primarily focus on:

* 💻 **Proxmox VE:** This serves as the foundation of my virtualization environment.
    * I use **Terraform** code to create and configure Virtual Machines (VMs).
    * I utilize **Packer** to build standardized, pre-configured VM images for Proxmox, which speeds up deployment and ensures consistency.

* 🐳 **Kubernetes (k3s):** My lightweight platform for running containerized applications.
    * The **Terraform** configurations prepare and set up the Proxmox VMs that function as the k3s cluster's **master** and **worker** nodes.

* 🔐 **1Password:** Although not code stored directly here, 1Password is an essential part of my homelab security. I use it to securely manage sensitive data required by these configurations (e.g., API tokens, passwords, SSH keys).

The purpose of this repository is to keep these files organized and potentially offer inspiration or serve as a starting point for other homelab enthusiasts. By using IaC with Terraform and image building with Packer, I can efficiently version, reproduce, and manage my lab setup reliably and securely.

---

📁 **Repository Structure**

You will find the configuration files organized into folders, typically grouping related components:

* `terraform/proxmox-k3s-cluster/`: Terraform files for deploying and configuring the k3s cluster VMs on Proxmox.
* `packer/`: Packer templates for building base VM images.
* ...and potentially other directories for future projects or tools.

---

🚀 **Getting Started / Usage**

It's important to note that these configurations are tailored to my specific homelab environment. If you wish to adapt and use them yourself, you **must** modify the variables (e.g., in `.tfvars` files or via environment variables) to match your own Proxmox setup, IP addresses, network configuration, and other parameters.

To use these files, you will need:

* 🛠️ **Terraform:** Installed on your machine.
* 🛠️ **Packer:** Installed on your machine (for image building).
* 🔌 **Proxmox Terraform Provider:** Configured to communicate with your Proxmox VE server.
* 🔑 A secure method for managing secrets (like **1Password** or another Vault solution).
* 🖥️ Access to a Proxmox VE environment.

**General Steps:**

1.  Clone the repository.
2.  Navigate to the specific configuration directory (e.g., `cd terraform/proxmox-k3s-cluster`).
3.  Copy the example `.tfvars` file (if provided) or create your own, and **modify the variables** within it to match your environment.
4.  Run the necessary commands (e.g., `` `terraform init` ``, `` `terraform plan` ``, `` `terraform apply` `` for Terraform, or `` `packer build <template.json>` `` for Packer templates).

---

🙏 Thanks for stopping by! I hope you find this repository interesting or useful.

Best regards,
Farkas Szilárd 