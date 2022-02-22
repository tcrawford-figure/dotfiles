if type brew &>/dev/null
then
    fpath+=(
        $(brew --prefix)/share/zsh/site-functions
    )
fi

eval "$(op completion zsh)"; compdef _op op

autoload -Uz compinit
compinit

