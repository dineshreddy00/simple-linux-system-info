#!/bin/bash

LOG_FILE="logs/system_report.log"

echo "====================================" >> $LOG_FILE
echo "System Health Report - $(date)" >> $LOG_FILE
echo "====================================" >> $LOG_FILE

echo "CPU Usage:" >> $LOG_FILE
top -bn1 | grep "Cpu" >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Memory Usage:" >> $LOG_FILE
free -h >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Disk Usage:" >> $LOG_FILE
df -h >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Running Processes:" >> $LOG_FILE
ps aux --sort=-%mem | head -5 >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Internet Connectivity:" >> $LOG_FILE
ping -c 2 google.com > /dev/null

if [ $? -eq 0 ]
then
    echo "Internet is working" >> $LOG_FILE
else
    echo "Internet is not working" >> $LOG_FILE
fi

echo "Report generated successfully!" >> $LOG_FILE
echo "" >> $LOG_FILE
