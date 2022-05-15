curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

sudo curl http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc -o ~/ACCC4CF8.asc
sudo apt-key add ~/ACCC4CF8.asc
sudo rm ~/ACCC4CF8.asc

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"