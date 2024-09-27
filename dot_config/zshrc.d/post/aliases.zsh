# Unalias stuff that I want
unalias gbr
unalias gco
unalias gg
unalias gsd
unalias gpv
unalias tff

# General
alias av="NVIM_APPNAME=avim nvim"
alias b="bat"
alias c="clear"
alias c.="code ."
alias ch="chezmoi"
alias cobra="cobra-cli"
alias csp="cloud-sql-proxy"
alias cv="NVIM_APPNAME=cvim nvim"
alias dtf="dependency-tree-diff"
alias glogin="gcloud auth login --update-adc"
alias gw="./gradlew"
alias j="just"
alias kv="NVIM_APPNAME=kvim nvim"
alias l="eza -alhB --ignore-glob=\".DS_Store\" --group-directories-first -s=name"
alias lz="NVIM_APPNAME=lazyvim nvim"
alias ld="./scripts/local-down.sh"
alias ldc="./dc.sh"
alias ldbi="./scripts/local-dbinit.sh"
alias lu="./scripts/local-up.sh"
alias mtf="./multf"
alias mx="mise"
alias n="npm"
alias nv="nvim"
alias nukebin="fd -t d bin --exec rm -rf"
alias nukeds="fd -t f -H .DS_Store --exec rm"
alias nukebuild="fd -t d build --exec rm -rf"
alias o.="open ."
alias pf="./scripts/port-forward.sh"
alias pip="pip3"
alias pc="pre-commit"
alias python="python3"
alias sc="lvim ~/.config/starship.toml"
alias sk="skaffold"
alias slurp="./scripts/slurp-app.sh $@"
alias tf="terraform"
alias tw="terraformw"
alias tff="fd --extension tf --extension tfvars -x terraform fmt"
alias v="lvim"
alias x="gh copilot"
alias y="yarn"
alias zc="lvim ~/.zshrc"
alias zca="lvim ~/.config/zshrc.d/post/aliases.zsh"
alias ze="lvim ~/.config/zshrc.d"
alias zs="source ~/.zshrc"

# just
alias jb="just build"
alias jbo="just bounce"
alias jp="just pull"
alias jr="just run"
alias js="just stop"
alias jue="just up -e"
alias ju="just up"

alias tg="terragrunt"
alias tgf="terragrunt hclfmt"
alias tgp="terragrunt run-all plan"

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
alias gpv="git prune --verbose"
alias gs="git s"
alias gsd="git stash drop"
alias gg="git gone"

alias gce="git commit --allow-empty -m \"Empty commit\""

function gcbt() {
  gcb "tcrawford/sc-$1/$2"
}

function gco () {
  git checkout $(git branch --all | fzf --exact -1 -0 --ansi --query "$1" | sed 's/remotes\/origin\///' | tr -d '*[:space:]')
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
  # tfswitch 
  mise i
  terraform init -upgrade
  terraform providers lock -platform=linux_amd64 -platform=darwin_amd64 -platform=darwin_arm64
  terraform fmt
  [[ -f "variables.tf" ]] && tfsort variables.tf
  [[ -f "outputs.tf" ]] && tfsort outputs.tf
  trivy config .
  terraform validate
}

function tfg() {
  # Find all directories and store them in an array
  mapfile -d '' directories < <(fd --type d --print0)

  # Iterate over each directory
  for dir in "${directories[@]}"; do
    echo "$dir"
    # Check if both files exist in the directory
    if [[ -f "$dir/main.tf" && -f "$dir/versions.tf" ]]; then
        cd "$dir" >/dev/null || exit

        # Delete .terraform directory if it exists
        if [[ -d ".terraform" ]]; then
            rm -rf .terraform
        fi

        tfswitch
        terraform get -update

        cd - >/dev/null || exit
    fi
  done
}
