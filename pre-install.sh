sudo rm ~/.gitignore&& sudo ln ./.gitignore ~/.gitignore
sudo rm ~/.gitconfig&& sudo ln ./.gitconfig ~/.gitconfig
sudo rm ~/.bashrc&& sudo ln ./.bashrc ~/.bashrc
sudo rm ~/.zshr&& sudo ln ./.zshr ~/.zshr

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install lts
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget -o- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
