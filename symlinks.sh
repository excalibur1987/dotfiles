echo "---------------Adding symlinks------------"

sudo rm ~/.gitignore
sudo rm ~/.gitconfig
sudo rm ~/.bashrc
sudo rm ~/.zshrc
sudo rm ~/.czrc
sudo ln ./dot-files/.gitignore ~/.gitignore
sudo ln ./dot-files/.gitconfig ~/.gitconfig
sudo ln ./dot-files/.bashrc ~/.bashrc
sudo ln ./dot-files/.zshrc ~/.zshrc
sudo ln ./dot-files/.czrc ~/.czrc

echo "---------------Symlinks Added------------"