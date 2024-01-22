mkdir -p $HOME/mssql/data
mkdir -p $HOME/mssql/backup

docker build -t custom-mssql-image $HOME/dotfiles/snippets/mssql-docker

docker run -d --name sql1-custom -p 1433:1433 -v $HOME/mssql/data:/var/opt/mssql/data/databases -v $HOME/mssql/backup:/var/opt/mssql/backup custom-mssql-image
