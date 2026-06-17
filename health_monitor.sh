#!/bin/bash

# Source token from secure file
source /path/to/where/stored/telegram_env

TOKEN="$TBOT_TOKEN"
CHAT_ID="$TCHATID"

echo "---------------------------------------------------"
echo "...Health Checker..."
sleep 2

# Collect metrics
RAM=$(free -h | grep "Mem" | awk '{print $4}')
echo "Available RAM IS: $RAM"

DS=$(df -h | grep "/$" | awk '{print $4}')
echo "Free Space on disk : $DS"

CPU=$(mpstat 1 1 | grep "Average" | awk '{print 100-$12}')
echo "CPU Usage is: $CPU%"

up=$(uptime -p)
echo "System Uptime is $up"

# Get SSH failed attempts
log_file="/var/log/auth.log"
echo "Checking Failed SSH Attempts..."
sleep 1

SSH_ATTEMPTS=$(sudo grep -i "failed password" $log_file 2>/dev/null | tail -5)

# Check if empty
if [ -z "$SSH_ATTEMPTS" ]; then
    SSH_ATTEMPTS="No failed SSH attempts detected"
fi

# Build message with heredoc
message=$(cat <<EOF
Boss, The scan has been completed here is the report:

Available RAM: $RAM
Free Space on disk: $DS
CPU Usage: $CPU%
System Uptime: $up

Last Failed SSH Attempts:
$SSH_ATTEMPTS

Thanks!
EOF
)


echo "---------------------------------------------------"
echo "Sending to Telegram..."

# Send to Telegram with proper quoting
curl -s -m 10 -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" \
  -d "chat_id=${CHAT_ID}" \
  -d "text=${message}"

echo ""
echo "Done, Check the report in the BOT"
echo "---------------------------------------------------"
