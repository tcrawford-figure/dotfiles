# General
# alias r='cd ~/dev/figure/$(ls ~/dev/figure | sort -r | fzf --exact -1 -0 --ansi --query "$1")'
alias c="clear"
alias cobra="cobra-cli"
alias ch="chezmoi"
alias gw="./gradlew"
alias l="exa -alhB --ignore-glob=\".DS_Store\" --group-directories-first -s=name"
alias n="npm"
alias nukebin="find . -type d -name \"bin\" -exec rm -rf {} \\;"
alias nukeds="find ./ -type f | grep .DS_Store | xargs rm"
alias o.="open ."
alias sc="lvim ~/.config/starship.toml"
alias v="lvim"
alias weather="curl wttr.in"
alias y="yarn"
alias zc="lvim ~/.zshrc"
alias zs="source ~/.zshrc"

# Brew
alias bop="brew update && brew outdated && brew upgrade && brew upgrade --cask --greedy && brew upgrade --formula && brew cleanup"

# Git

## Git rebase develop
alias grbod='git rebase origin/"$(git_develop_branch)"'

## Git merge develop
alias gmod='git merge origin/"$(git_develop_branch)"'

alias ga.="ga ."
alias gac="ga . && gc"
alias gpu="git pu"
alias gs="git s"

# K8s 
alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"
alias kt="kc test"
alias kp="kc prod"

# dbenv
alias pdbenv='eval "$(dbenv prod)"'
alias tdbenv='eval "$(dbenv test)"'
alias ldbenv='eval "$(dbenv local)"'
alias udbenv='eval "$(dbenv unset)"'

# cht.sh
function cht() {
  curl cht.sh/"$1"/${2// /+}
}

function r() {
  repos="$HOME/dev/figure/"
  cd $repos/$(ls $repos | sort -r | fzf --exact -1 -0 --ansi --query "$1")
}
