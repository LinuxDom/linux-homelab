# linux-homelab

# Homelab Ansible Playbooks

A collection of Ansible playbooks for managing and securing 
a personal cloud-based Linux homelab running on Oracle Cloud 
Infrastructure.

## Playbooks
- **hardening.yml** — Automates security hardening across all 
servers including SSH hardening, firewalld configuration, 
and fail2ban installation
- **user_management.yml** — Creates a standard non-root admin 
user with sudo privileges and deploys SSH key authentication, 
then locks the default cloud account
- **monitoring_pub.yml** - Deploys a monitoring stack across all 
servers including htop for process monitoring, sysstat for 
system performance data collection, and logwatch for automated 
log summarization. Implements Ansible handlers for conditional 
service restarts and Jinja2 templates for dynamic configuration 
file generation.

## Scripts
- **check_services.sh** — Verifies fail2ban and firewalld are 
active and enabled across all production servers via SSH

## Notes
- Replace placeholder values in vars blocks with your 
actual configuration before running playbooks

## Environment
- Control Node: macOS with Ansible installed via pip3
- Managed Nodes: Oracle Cloud x86 and ARM compute instances 
running Oracle Linux 10

## Tools Used
- Ansible
- Oracle Cloud Infrastructure
- firewalld
- fail2ban
