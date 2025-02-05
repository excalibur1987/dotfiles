#!/bin/bash

# Log file location in user's home directory
LOG_FILE="$HOME/localstack-startup.log"

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
    echo "$message"  # Also print to stdout for immediate feedback
}

function create_s3_bucket() {
    # Try to create S3 bucket
    for i in {1..3}; do
        log_message "Attempting to create S3 bucket 'psc' (attempt $i of 3)..."
        if /usr/bin/aws --endpoint-url=http://localhost:4566 --profile localstack --no-sign-request s3 mb s3://psc 2>> "$LOG_FILE"; then
            log_message "Successfully created S3 bucket 'psc'"
            return 0
        else
            log_message "Attempt $i to create S3 bucket failed. Checking if bucket already exists..."
            # Check if bucket already exists
            if /usr/bin/aws --endpoint-url=http://localhost:4566 --profile localstack --no-sign-request s3 ls "s3://psc" &>/dev/null; then
                log_message "Bucket 'psc' already exists"
                return 0
            fi
            log_message "Waiting 5 seconds before next attempt..."
            sleep 5
        fi
    done
    log_message "ERROR: Failed to create S3 bucket after 3 attempts"
    return 1
}

# Function to check if LocalStack is running
check_localstack() {
    local max_retries=${1:-30}  # Default to 30 if not specified
    log_message "Checking if LocalStack is running (max $max_retries attempts)..."
    for i in $(seq 1 $max_retries); do
        if curl -s http://localhost:4566/_localstack/health > /dev/null; then
            log_message "LocalStack is responding on port 4566"
            return 0
        fi
        log_message "Waiting for LocalStack to start (attempt $i of $max_retries)..."
        sleep 2
    done
    log_message "ERROR: LocalStack health check failed after $((max_retries * 2)) seconds"
    return 1
}

# Clear the log file at the start of each run
echo "" > "$LOG_FILE"
log_message "Starting LocalStack startup script..."

# Check if Docker is running
if ! docker info >/dev/null 2>&1; then
    log_message "ERROR: Docker is not running. Please start Docker first."
    exit 1
fi

# Set AWS environment variables for LocalStack
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"
export AWS_ENDPOINT="http://localhost:4566"
export AWS_REGION="us-east-1"


if ! check_localstack 3; then
    # Start LocalStack
    log_message "Starting LocalStack..."
    localstack start -d
    
    if check_localstack 5; then
        log_message "LocalStack started successfully"
        create_s3_bucket
    else
        log_message "ERROR: LocalStack failed to start within timeout period"
        log_message "Checking Docker logs for LocalStack container..."
        docker logs localstack-main 2>&1 | tail -n 20 >> "$LOG_FILE"
        exit 1
    fi
else
    log_message "LocalStack is already running"
    create_s3_bucket
fi

