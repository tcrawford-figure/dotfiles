# Path oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

## ZSH theme - backup in case starship isn't working
ZSH_THEME="robbyrussell"

## Automatically update without prompting
DISABLE_UPDATE_PROMPT="true"

## Enable command auto-correction
ENABLE_CORRECTION="false"

## oh-my-zsh plugins
plugins=(
  aliases
  git
  gh
  golang
  brew
  terraform
  fzf
  git-extra-commands
)

# Source oh-my-zsh into existence
source $ZSH/oh-my-zsh.sh

# Requires brew install zsh-autosuggestions zsh-syntax-highlighting
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
