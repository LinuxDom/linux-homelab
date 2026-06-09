#!/bin/bash

SERVERS=("prod1" "prod2")
SERVICES=("fail2ban" "firewalld")

for SERVER in "${SERVERS[@]}"; do
	echo "Checking $SERVER..."
	for SERVICE in "${SERVICES[@]}"; do
		ssh "$SERVER" "
		if systemctl is-active --quiet "$SERVICE" && systemctl is-enabled --quiet "$SERVICE"; then
		echo "$SERVICE is active and enabled"
	else
		echo "$SERVICE is not active and/or not enabled"
	fi"
	done
	echo ""
done



