#!/bin/bash

# Ensure the script is run with root/sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "[-] Please run this script with sudo or as root. [-]"
  exit 1
fi

EXIT_CODE=0

echo "=========================="
echo "  Server Hardening Audit  "
echo "=========================="

# Check SSH: PermitRootLogin no
echo "[-] Checking PermitRootLogin... [-]"
SSH_ROOT_LOGIN=$(sshd -T 2>/dev/null | grep -i "^permitrootlogin" | awk '{print $2}')
if [ "$SSH_ROOT_LOGIN" = "no" ]; then
    echo "[PASS] --- PermitRootLogin is set to 'no'"
else
    echo "[FAIL] --- Current value: '${SSH_ROOT_LOGIN:-unknown}', expected 'no'"
    EXIT_CODE=1
fi

# Check SSH: PasswordAuthentication no
echo "[-] Checking PasswordAuthentication... [-]"
SSH_PASS_AUTH=$(sshd -T 2>/dev/null | grep -i "^passwordauthentication" | awk '{print $2}')
if [ "$SSH_PASS_AUTH" = "no" ]; then
    echo "[PASS] --- PasswordAuthentication is set to 'no'"
else
    echo "[FAIL] --- Current value: '${SSH_PASS_AUTH:-unknown}', expected 'no'"
    EXIT_CODE=1
fi

# Check Firewalld Status
echo "[-] Checking firewalld status... [-] "
if systemctl is-active --quiet firewalld; then
    echo "[PASS] --- firewalld is active and running"
else
    echo "[FAIL] --- firewalld is NOT active"
    EXIT_CODE=1
fi

# Check Fail2ban Status
echo "[-] Checking fail2ban service... [-] "
if systemctl is-active --quiet fail2ban; then
    echo "[PASS] --- fail2ban is running"
else
    echo "[FAIL] --- fail2ban is NOT running"
    EXIT_CODE=1
fi

echo "=========================="
if [ "$EXIT_CODE" -eq 0 ]; then
    echo "[-] All hardening checks passed successfully! [-]"
else
    echo "[-] Some checks failed. Please review output above. [-]"
fi

exit "$EXIT_CODE"
