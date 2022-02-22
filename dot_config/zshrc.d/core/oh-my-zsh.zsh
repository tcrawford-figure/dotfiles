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
  brew
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions
)

# Source oh-my-zsh into existence
source $ZSH/oh-my-zsh.sh
