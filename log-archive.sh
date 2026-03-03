#!/bin/bash

#Check if argument is provides

if [ -z "$1" ]; then 
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

LOG_DIR=$1

#Check if directory exists

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory does not exist"
    exit 1
fi

# Create an archive directory if it doesn't exist

ARCHIVE_DIR="./archives"
mkdir -p "$ARCHIVE_DIR"


# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive filename
ARCHIVE_FILE="log_archive_${TIMESTAMP}.tar.gz"

#Create tar.gz archive

tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" "$LOG_DIR"

# Log archive action
echo "[$(date +"%Y-%m-%d %H:%M:%S")] Archived $LOG_DIR to $ARCHIVE_FILE" >> archive_log.txt

echo "Archive creates successfully: $ARCHIVE_DIR/$ARCHIVE_FILE"