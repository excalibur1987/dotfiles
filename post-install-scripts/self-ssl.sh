sudo mkdir -p /etc/ssl
sudo mkdir -p /etc/nginx/conf.d/ssl

sudo cp ./self-ssl/cert.crt /etc/ssl/certs/cert.crt
sudo cp ./self-ssl/cert.key /etc/ssl/private/cert.key

sudo cp ./dot-files/local-ssl /etc/nginx/conf.d/ssl/self