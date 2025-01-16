python3 -m pip install --upgrade localstack

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
Environment="PATH=/usr/local/bin:/usr/bin:/bin"

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