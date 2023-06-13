service_name=localstack.service

target_path="/etc/systemd/system/"$service_name

sudo touch $target_path

template="
[Unit]
Description=Start Localstack container

[Service]
ExecStart=/usr/bin/docker-compose up -d -f "$(pwd)"/localstack/docker-compose.yml&&awsmb

[Install]
WantedBy=multi-user.target
"

echo $template | sudo tee $target_path

sudo systemctl daemon-reload
sudo systemctl enable $service_name
sudo systemctl restart $service_name