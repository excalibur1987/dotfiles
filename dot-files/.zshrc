# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fwalch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git postgres npm python docker docker-compose)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source $ZSH/oh-my-zsh.sh

# alias for activating local python venv
alias penv="source env/bin/activate && source .env"

# alias for local stack aws-cli make-bucket
awsmb(){
    aws --endpoint-url=http://localhost:4566 --no-sign-request s3 mb s3://$1
}

alias awsl="aws --endpoint-url=http://localhost:4566 --no-sign-request"

alias python="python3"

# aliases for git
alias gitr="git checkout release && git merge master && git push "
alias commit="git cz -n cz_commitizen_emoji commit"
alias changelog="git cz bump --changelog"

restart-services(){
    sudo service nginx restart
    sudo service redis-server restart
    sudo service postgresql restart
}

gcob(){
    git checkout -b $1
    git push --set-upstream origin $1
}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="$PATH:~/azuredatastudio-linux-x64:/usr/bin:$HOME/.local/lib/python3.8/site-packages:$HOME/.local/bin"


getBranchName(){
    echo $(git rev-parse --abbrev-ref HEAD)
}


gitpu(){
    git push --set-upstream origin $(getBranchName)
}

gbdr(){
    gbd $1
    git push -d origin $1
}

gwtb(){
    git worktree add -f --track -b $1 $2
}


alias localstackt="docker run --rm -it -d -p 4566:4566 -p 4571:4571 localstack/localstack -e DATA_DIR=/tmp/localstack/data  \
  -v $HOME/.docker/containers/s3:/tmp/localstack"
# pnpm
export PNPM_HOME="/home/omar/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
alias upgrade="sudo apt update&&sudo apt upgrade -y&&sudo apt autoremove -y"
alias runapp="cd /home/omar/projects/updateServer&&source /home/omar/.cache/pypoetry/virtualenvs/updateserver-zLyjSblX-py3.8/bin/activate&&source .env&&python main.py"

export PATH="$PATH:/opt/mssql-tools17/bin"

# add bin scripts to path
export PATH="$PATH:/home/omar/dotfiles/bin"