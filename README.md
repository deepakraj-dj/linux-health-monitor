# Linux System Health Monitor with Telegram Alerts
## Overview
A lightweight Bash script that monitors your Linux server health and sends real-time reports straight to your Telegram.


## What It Does
Checks available RAM, disk space, CPU usage, and system uptime
Grabs the last failed SSH login attempts from auth.log
Sends a formatted report to your Telegram chat automatically


## Prerequisites
- Linux server (Ubuntu/Debian)
- Telegram Bot Token and Chat ID

## Setup

- **Clone the repo**
  
  - git clone https://github.com/deepakraj-dj/linux-health-monitor

- Add your Telegram credentials in health_monitor.sh
  - TOKEN=""    # Your Telegram Bot Token
  - CHAT_ID=""  # Your Telegram Chat ID

- Make it executable
  - chmod +x health_monitor.sh

- Run it
  - bash./health_monitor.sh
- Automate with Cron
  - Run every hour automatically:
    
    - bashcrontab -e
  
# add this line:
0 * * * * /path/to/health_monitor.sh
Sample Telegram Output
Boss, The scan has been completed here is the report,

📊 Available RAM : 1.2G
Free Space on disk : 8.5G
CPU Usage is: 23%
System Uptime is up 2 hours, 30 minutes
The last Failed SSH Attempts
Failed password for root from 192.168.1.1

Thanks, let me know if I want to assist with anything 😄
Tech Stack

Bash Scripting
Telegram Bot API
Linux system tools (free, df, mpstat, uptime)
curl for API calls
EC2 (Ubuntu)
