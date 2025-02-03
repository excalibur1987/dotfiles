# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/omar/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# custom scripts
export PATH="$PATH:$HOME/dotfiles/bin"

# locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Cursor alias
function cursor() {
    /opt/cursor.appimage --no-sandbox "${@}" > /dev/null 2>&1 & disown
}

# pnpm aliases
alias pnpx="pnpm dlx"
alias pi="pnpm i --shamefully-hoist"

# upgrade aliases
alias upgrade="sudo apt update&&sudo apt upgrade -y&&sudo apt autoremove -y"

# git aliases
alias diff="git --no-pager diff --cached"
alias diff-save="git diff --cached > staged_changes.diff"

# python aliases
alias python="python3"
alias activate="source ./.venv/bin/activate"



export PATH="$HOME/.local/bin:$PATH"

if [ -f "$HOME/.cargo/env" ]; then
   . "$HOME/.cargo/env"
fi
