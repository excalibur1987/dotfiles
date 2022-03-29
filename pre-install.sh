sudo rm ~/.gitignore&& sudo ln ./.gitignore ~/.gitignore
sudo rm ~/.gitconfig&& sudo ln ./.gitconfig ~/.gitconfig
sudo rm ~/.bashrc&& sudo ln ./.bashrc ~/.bashrc
sudo rm ~/.zshr&& sudo ln ./.zshr ~/.zshr

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

sudo curl http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc -o ~/ACCC4CF8.asc
sudo apt-key add ~/ACCC4CF8.asc
sudo rm ~/ACCC4CF8.asc
