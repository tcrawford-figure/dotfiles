# General
alias c="clear"
alias ch="chezmoi"
alias gw="./gradlew"
alias l="exa -alhB --ignore-glob=\".DS_Store\" --group-directories-first -s=name"
alias n="npm"
alias nukeds="find ./ -type f | grep .DS_Store | xargs rm"
alias o.="open ."
alias sc="lvim ~/.config/starship.toml"
alias v="lvim"
alias weather="curl wttr.in"
alias y="yarn"
alias zc="lvim ~/.zshrc"
alias zs="source ~/.zshrc"

# Git
alias gpd="git co develop && git pull && git co -"
alias gmd="gpd && git merge develop"
alias grd="gpd && git rebase develop"

alias gpm="git co main && git pull && git co -"
alias gmm="gpm && git merge main"
alias grm="gpm && git rebase main"

alias gpms="git co master && git pull && git co -"
alias gmms="gpms && git merge master"
alias grms="gpms && git rebase master"

alias gp="git push"
alias gpl="git pull"
alias gpf="git push --force-with-lease"
alias gpu="git pu"
alias gs="git s"

# K8s 
alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"
alias kt="kc test"
alias kp="kc prod"

