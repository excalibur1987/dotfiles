curl --output localstack-cli-4.0.0-linux-amd64-onefile.tar.gz \
    --location https://github.com/localstack/localstack-cli/releases/download/v4.0.0/localstack-cli-4.0.0-linux-amd64-onefile.tar.gz

sudo tar -xvf localstack-cli-4.0.0-linux-amd64-onefile.tar.gz -C /usr/local/bin

service_name=localstack.service

sudo cp "${BASH_SOURCE%/*}/../snippets/localstack-startup.sh" /usr/local/bin/localstack-startup.sh

target_path="/etc/systemd/system/"$service_name

sudo touch $target_path

template="
[Unit]
Description=LocalStack Service with S3 Bucket Creation
After=network.target
StartLimitIntervalSec=300
StartLimitBurst=5

[Service]
Type=forking
User=omar
Group=omar

# Create a script that will be executed by the service
ExecStart=/usr/local/bin/localstack-startup.sh

# Ensure proper cleanup on stop
ExecStop=/usr/bin/pkill -f localstack

# Restart policy
Restart=on-failure
RestartSec=30s

# Security settings
ProtectSystem=full
PrivateTmp=true
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
"

echo $template | sudo tee $target_path

sudo systemctl daemon-reload
sudo systemctl enable $service_name
sudo systemctl restart $service_name

# Configure AWS CLI profile for LocalStack
aws configure set aws_access_key_id "access_key" --profile localstack
aws configure set aws_secret_access_key "secret_access_key" --profile localstack
aws configure set region "us-east-1" --profile localstack
aws configure set output "json" --profile localstack

# Set custom endpoint for LocalStack
aws configure set endpoint_url "http://localhost:4566" --profile localstack
