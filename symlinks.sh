echo "---------------Adding symlinks------------"

sudo rm ~/.gitignore || true
sudo rm ~/.gitconfig || true
sudo rm ~/.bashrc || true
sudo rm ~/.zshrc || true
sudo rm ~/.czrc || true
sudo ln $(pwd)/dot-files/.gitignore ~/.gitignore
sudo ln $(pwd)/dot-files/.gitconfig ~/.gitconfig
sudo ln $(pwd)/dot-files/.bashrc ~/.bashrc
sudo ln $(pwd)/dot-files/.zshrc ~/.zshrc
sudo ln $(pwd)/dot-files/.czrc ~/.czrc

echo "---------------Symlinks Added------------"