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
- **monitoring.yml** - Deploys a monitoring stack across all 
servers including htop for process monitoring, sysstat for 
system performance data collection, and logwatch for automated 
log summarization. Implements Ansible handlers for conditional 
service restarts and Jinja2 templates for dynamic configuration 
file generation. Sensitive configuration (e.g. notification email) is now 
managed via Ansible Vault — see commit history for the 
evolution from placeholder values to encrypted secrets.
- **check_uptime.yml** — Deploys uptime check script and
systemd timer to prod servers, scheduling automated uptime
and load average reporting

## Scripts
- **check_services.sh** — Verifies fail2ban and firewalld are 
active and enabled across all production servers via SSH
- **uptime_check.sh** — Reports system uptime, user sessions, 
and load averages across all production servers

## Notes
- Replace placeholder values in vars blocks with your 
actual configuration before running playbooks

## Environment
- Control Node: macOS with Ansible installed via pip3
- Managed Nodes: Oracle Cloud x86 and ARM compute instances 
running Oracle Linux 10

## Tools Used
- Ansible
- Oracle Cloud Infrastructure (Always Free Tier)
- Oracle Linux 10 (x86_64 and ARM/aarch64)
- firewalld
- fail2ban
- sysstat
- logwatch
- Bash
- Git/GitHub
- SSH/OpenSSH
- cron
- systemd(timers)
