# General
alias b="bat"
alias c="clear"
alias c.="code ."
alias ch="chezmoi"
alias cobra="cobra-cli"
alias csp="cloud-sql-proxy"
alias dtf="dependency-tree-diff"
alias gw="./gradlew"
alias j="just"
alias l="eza -alhB --ignore-glob=\".DS_Store\" --group-directories-first -s=name"
alias ld="./scripts/local-down.sh"
alias ldc="./dc.sh"
alias ldbi="./scripts/local-dbinit.sh"
alias lu="./scripts/local-up.sh"
alias n="npm"
alias nv="nvim"
alias nukebin="fd -t d bin --exec rm -rf"
alias nukeds="fd -t f -H .DS_Store --exec rm"
alias nukebuild="fd -t d build --exec rm -rf"
alias o.="open ."
alias pf="./scripts/port-forward.sh"
alias pip="pip3"
alias python="python3"
alias sc="lvim ~/.config/starship.toml"
alias sk="skaffold"
alias slurp="./scripts/slurp-app.sh $@"
alias tf="terraform"
alias v="lvim"
alias y="yarn"
alias zc="lvim ~/.zshrc"
alias zca="lvim ~/.config/zshrc.d/post/aliases.zsh"
alias ze="lvim ~/.config/zshrc.d"
alias zs="source ~/.zshrc"

# just
alias jb="just build"
alias jbo="just bounce"
alias jp="just provision"
alias jpl="just pull"
alias jr="just run"
alias js="just stop"

# Brew
function bop() {
  brew update
  brew outdated
  brew upgrade
  brew upgrade --cask --greedy
  brew upgrade --formula
  brew cleanup
  brew autoremove
}

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
alias gcom="git checkout origin/main"
alias gpu="git pu"
alias gs="git s"
alias gg="git gone"

alias gce="git commit --allow-empty -m \"Empty commit\""

function gcbt() {
  gcb "tcrawford/sc-$1/$2"
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

# cht.sh
function cht() {
  curl cht.sh/"$1"/${2// /+}
}

function r() {
  repos="$HOME/dev/figure/"
  cd $repos/$(ls $repos | sort -r | fzf --exact -1 -0 --ansi --query "$1")
}

function ra() {
  # Specify the target directory
  target_dir="$HOME/dev"

  # Initialize an empty array to store ls results with relative paths
  result=()

  # Change to the target directory
  cd "$target_dir" || exit

  # Iterate through directories in the target directory
  for dir in */; do
      # Run ls on each directory, prepend $dir to each result, and append to the array
      while IFS= read -r line; do
          result+=("$dir$line")
      done < <(ls "$dir")
  done

  # Sort the result array in reverse order
  sorted_result=($(printf "%s\n" "${result[@]}" | sort -r))

  # Use fzf for interactive selection
  selected=$(printf '%s\n' "${sorted_result[@]}" | fzf --exact -1 -0 --ansi --query="$1")

  # Change directory to the selected directory (relative to target_dir)
  cd "$target_dir/$selected" || exit
}

function tfb() {
  tfswitch 
  terraform init -upgrade
  terraform providers lock -platform=linux_amd64 -platform=darwin_amd64 -platform=darwin_arm64
  terraform fmt
  terraform validate
}
