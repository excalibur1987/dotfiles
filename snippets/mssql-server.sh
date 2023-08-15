mkdir -p /home/omar/mssql/data
mkdir -p /home/omar/mssql/backup

docker build -t custom-mssql-image /home/omar/dotfiles/snippets/mssql-docker

docker run -d --name sql1-custom -p 1433:1433 -v /home/omar/mssql/data:/var/opt/mssql/data/databases -v /home/omar/mssql/backup:/var/opt/mssql/backup custom-mssql-image
