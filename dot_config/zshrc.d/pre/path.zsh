# Makes use of zsh path variable
path=(
    $HOME/bin
    $HOME/.local/bin
    $HOME/.docker/bin
    $HOME/.cargo/bin
    $(go env GOPATH)/bin
    /usr/local/bin
    /usr/local/sbin
    $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
    /usr/local/opt/openjdk@11/bin
    $HOME/dev/scripts/helper-scripts/bin
    "${KREW_ROOT:-$HOME/.krew}/bin"
    $path
)

