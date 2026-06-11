
#!/bin/bash

TOKEN=""
CHAT_ID=""
echo "---------------------------------------------------"
echo "...Health Checker..."
sleep 2

RAM=$(free -h | grep "Mem" | awk '{print $4}')
echo "Available RAM IS: $RAM"

DS=$(df -h | grep "sda2" | awk '{print $4}')
echo "Free Space on disk : $DS"

CPU=$(mpstat 1 1 | grep "Average" | awk '{print 100-$12}')
echo "CPU Usage is: $CPU%"

up=$(uptime -p)
echo "System Uptime is $up"

log_file="/var/log/auth.log"
echo "The last Failed SSH Attempts"
sleep 3
SSH_ATTEMPTS=$(grep -i "failed password" $log_file | tail)

# NOW create the message with all data
message="Boss, The scan has been completeted here is the report, 

📊 Available RAM : $RAM
Free Space on disk : $DS
CPU Usage is: $CPU%
System Uptime is $up
The last Failed SSH Attempts
$SSH_ATTEMPTS

Thanks, let me know if i want to assist with anything 😄
"

# Send to Telegram with proper quoting
curl -X POST https://api.telegram.org/bot${TOKEN}/sendMessage \
  -d chat_id=${CHAT_ID} \
  -d "text=${message}" \
  -d parse_mode="Markdown"


