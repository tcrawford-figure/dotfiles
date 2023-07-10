# General
alias c="clear"
alias ch="chezmoi"
alias cobra="cobra-cli"
alias gw="./gradlew"
alias l="exa -alhB --ignore-glob=\".DS_Store\" --group-directories-first -s=name"
alias ld="./scripts/local-down.sh"
alias ldc="./dc.sh"
alias ldbi="./scripts/local-dbinit.sh"
alias lu="./scripts/local-up.sh"
alias n="npm"
alias nv="nvim"
alias nukebin="fd -t d bin --exec rm -rf"
alias nukeds="fd -t f -H .DS_Store --exec rm"
alias o.="open ."
alias pf="./scripts/port-forward.sh"
alias sc="lvim ~/.config/starship.toml"
alias sk="skaffold"
alias slurp="./scripts/slurp-app.sh $@"
alias tf="terraform"
alias v="lvim"
alias weather="curl wttr.in"
alias y="yarn"
alias zc="lvim ~/.zshrc"
alias ze="lvim ~/.config/zshrc.d"
alias zs="source ~/.zshrc"

# act command override
act () { env DOCKER_HOST="$(docker context inspect -f '{{.Endpoints.docker.Host}}')" /usr/local/bin/act $*}

# mmdc - needs function to fetch pwd properly
# alias mmdc="docker run -it -v $(pwd):/data minlag/mermaid-cli $@"
function mmdc() { 
  docker run -it -v $(pwd):/data minlag/mermaid-cli $@
}

# Brew
alias bop="brew update && brew outdated && brew upgrade && brew upgrade --cask --greedy && brew upgrade --formula && brew cleanup"
# unalias buf

# Git

unalias gbr
unalias gco
unalias gg

## Git rebase develop
alias grbod='git rebase origin/"$(git_develop_branch)"'

## Git merge develop
alias gmod='git merge origin/"$(git_develop_branch)"'

alias ga.="ga ."
alias gac="ga . && gc"
alias gbr="git br"
alias gco-="git checkout -"
alias gpu="git pu"
alias gs="git s"
alias gg="git gone"

function gcbt() {
  gcb "tylercrawford/sc-$1/$2"
}

function gco () {
  git checkout $(git branch --all | fzf --exact -1 -0 --ansi --query "$1" | tr -d '*[:space:]')
}

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
