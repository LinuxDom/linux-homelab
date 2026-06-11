#!/bin/bash

SERVERS=("prod1" "prod2")

echo "Checking servers..."
echo "=== System Uptime & Load - $(date) ==="
echo "Current Time | Uptime Duration | Number of Users | Load Averages: 1/5/15 Minutes"

for SERVER in "${SERVERS[@]}"; do
	ssh "$SERVER" "
	echo "The uptime for $SERVER:"
	uptime"
done
