# linux-homelab

# Homelab Ansible Playbooks

A collection of Ansible playbooks for managing and securing 
a personal cloud-based Linux homelab running on Oracle Cloud 
Infrastructure.

## STIG Compliance
- **stig_compliance.yml** — Applies DISA STIG-aligned security
controls via the rhel_stig role, covering SSH hardening, DoD
login banners, authentication policy, auditd configuration,
kernel parameter hardening, and file permission enforcement

### Running specific control areas
ansible-playbook -i inventory.ini stig_compliance.yml --tags ssh
ansible-playbook -i inventory.ini stig_compliance.yml --tags audit
ansible-playbook -i inventory.ini stig_compliance.yml --tags sysctl

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
- **deploy_scripts.yml** — Deploys bash scripts to prod servers, 
ensuring correct ownership and executable permissions

## Roles
- **hardening** — Role-based refactor of hardening playbook,
organizing tasks into reusable Ansible role structure
- **monitoring** — Full role conversion of monitoring playbook 
including tasks, handlers, vars, and Jinja2 template

## Scripts
- **check_services.sh** — Verifies fail2ban and firewalld are 
active and enabled across all production servers via SSH
- **uptime_check.sh** — Reports system uptime, user sessions, 
and load averages across all production servers
- **verify_hardening.sh** — Security audit script verifying 
SSH hardening, firewalld, and fail2ban status across prod 
servers. Requires root/sudo privileges.

## Notes
- Replace placeholder values in vars blocks with your 
actual configuration before running playbooks

## Environment
- Control Node: macOS with Ansible installed via pip3
- Managed Nodes: Oracle Cloud x86 and ARM compute instances 
running Oracle Linux 10

## Tools Used
- Ansible (Playbooks, Roles, Handlers, Jinja2 Templates, Vault)
- Oracle Cloud Infrastructure (Always Free Tier)
- Oracle Linux 10 (x86_64 and ARM/aarch64)
- DISA STIG (CAT I & CAT II compliance controls)
- auditd
- PAM (Pluggable Authentication Modules)
- firewalld
- fail2ban
- sysstat
- logwatch
- Bash
- Git/GitHub
- SSH/OpenSSH
- cron
- systemd (timers)
