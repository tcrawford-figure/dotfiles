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

#compdef cdktf
###-begin-cdktf-completions-###
#
# yargs command completion script
#
# Installation: /usr/local/bin/cdktf completion >> ~/.zshrc
#    or /usr/local/bin/cdktf completion >> ~/.zprofile on OSX.
#
_cdktf_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /usr/local/bin/cdktf --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _cdktf_yargs_completions cdktf
###-end-cdktf-completions-###

source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

