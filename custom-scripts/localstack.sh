service_name=localstack.service

target_path="/etc/systemd/system/"$service_name

sudo touch $target_path

template="
[Unit]
Description=Start Localstack container

[Service]
ExecStart=/usr/bin/docker-compose -f "$(pwd)"/localstack/docker-compose.yml up --force-recreate -d&&/usr/bin/aws --endpoint-url=http://localhost:4566 --no-sign-request s3 mb s3://psc

[Install]
WantedBy=multi-user.target
"

echo $template | sudo tee $target_path

sudo systemctl daemon-reload
sudo systemctl enable $service_name
sudo systemctl restart $service_name