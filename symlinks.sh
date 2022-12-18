echo "---------------Adding symlinks------------"

sudo rm ~/.gitignore || true
sudo rm ~/.gitconfig || true
sudo rm ~/.bashrc || true
sudo rm ~/.zshrc || true
sudo rm ~/.czrc || true
sudo ln ./dot-files/.gitignore ~/.gitignore
sudo ln ./dot-files/.gitconfig ~/.gitconfig
sudo ln ./dot-files/.bashrc ~/.bashrc
sudo ln ./dot-files/.zshrc ~/.zshrc
sudo ln ./dot-files/.czrc ~/.czrc

echo "---------------Symlinks Added------------"