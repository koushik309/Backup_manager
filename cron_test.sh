#!/bin/bash

# cron_test.sh

# Set working directory to the script's location
cd "$(dirname "$0")"

LOG_FILE="./logs/cron_test.log"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "[$TIMESTAMP] Cron test started" >> "$LOG_FILE"

# Simulate backup task
./backup.sh ~/Documents --dry-run >> "$LOG_FILE" 2>&1

echo "[$TIMESTAMP] Cron test finished" >> "$LOG_FILE"
