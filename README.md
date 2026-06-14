# Linux System Health Monitor with Telegram Alerts
## Overview
This project automates server health monitoring using a simple Bash script. Instead of manually checking your server status, the script collects key metrics and sends them directly to your Telegram account via cron job automation. Perfect for DevOps engineers, system administrators, and anyone who needs to keep tabs on their Linux servers.

## Architecture Diagram
![Architecture Diagram](docs/architecture_diagram.png)

## Key Features:
 - Real-time CPU, RAM, and disk space monitoring
 - Tracks system uptime and failed SSH login attempts
 - Automated execution every 30 minutes via cron jobs
 - Secure token management using separate configuration file 
 - Lightweight implementation with minimal server overhead
 - Direct Telegram notifications to your phone or desktop

## What It Does

## How It All Works Together
The monitoring solution works in three main Steps:
### Step 1: Scheduling
- The cron job triggers automatically every 30 minutes using the schedule */30 * * * *. No manual intervention needed - it runs completely in the background.

### Step 2: Data Collection
 - When the script runs, it collects five critical server metrics:
 1. CPU usage percentage using mpstat
 2. Available RAM in human-readable format
 3. Free disk space on the root partition
 4. System uptime in a friendly format
 5. Last 5 failed SSH login attempts from auth.log


### Step 3: Notification
The script sources your Telegram credentials from a secure configuration file, builds a formatted message with all collected metrics, and sends it via Telegram's BOT API. You receive the report instantly on your Telegram app.

The architecture ensures credentials remain secure, the script runs automatically without passwords, and you get consistent monitoring coverage around the clock.


## Prerequisites
### System Requirements:

Linux server running Ubuntu or Debian-based distribution
Bash shell (version 4.0 or higher)
Root or sudo access (for reading auth.log)
Basic commands: free, df, uptime, grep, mpstat, curl

### Telegram Setup:

Telegram account (create one at telegram.org if you don't have it)
Telegram BOT token (create a bot via @BotFather on Telegram)
Your Telegram Chat ID (message @userinfobot to get your ID)


### File Permissions:

Write access to /home/your_username/ directory
Read access to /var/log/auth.log
Execute permissions for the script

## Tech Stack
 - Bash Scripting
 - Telegram Bot API
 - Linux system tools (free, df, mpstat, uptime)
 - curl for API calls
 - EC2 (Ubuntu)

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
    - 0 * * * * /path/to/health_monitor.sh
      


## Sample Telegram Output
Boss, The scan has been completed here is the report,

📊 Available RAM : 1.2G
Free Space on disk : 8.5G
CPU Usage is: 23%
System Uptime is up 2 hours, 30 minutes
The last Failed SSH Attempts
Failed password for root from 192.168.1.1

Thanks, let me know if I want to assist with anything 😄

