#!/bin/bash

# Log file location in user's home directory
LOG_FILE="$HOME/localstack-startup.log"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Function to check if LocalStack is running
check_localstack() {
    for i in {1..30}; do
        if curl -s http://localhost:4566 > /dev/null; then
            return 0
        fi
        sleep 2
    done
    return 1
}

# Start LocalStack
log_message "Starting LocalStack..."
localstack start -d

# Wait for LocalStack to be ready
if ! check_localstack; then
    log_message "ERROR: LocalStack failed to start within timeout period"
    exit 1
fi

log_message "LocalStack started successfully"

# Try to create S3 bucket
for i in {1..3}; do
    if /usr/bin/aws --endpoint-url=http://localhost:4566 --profile localstack --no-sign-request s3 mb s3://psc 2>> "$LOG_FILE"; then
        log_message "Successfully created S3 bucket 'psc'"
        exit 0
    else
        log_message "Attempt $i to create S3 bucket failed"
        sleep 5
    fi
done

log_message "ERROR: Failed to create S3 bucket after 3 attempts"
exit 1
