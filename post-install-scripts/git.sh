git config --global pull.rebase true

git config --global user.email "excalibur1987@gmail.com"
git config --global user.name "Omar Ali"

git config --global core.excludesFile '~/.gitignore'


npm install -g commitizen git-cz
commitizen init git-cz --save-dev --save-exact --force
npm install -g cz-emoji