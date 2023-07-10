if type brew &>/dev/null
then
    fpath+=(
        $(brew --prefix)/share/zsh/site-functions
    )
fi

eval "$(op completion zsh)"; compdef _op op

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -o nospace -C "$(which terraform)" terraform

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: /usr/local/bin/gt completion >> ~/.zshrc
#    or /usr/local/bin/gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /usr/local/bin/gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###

