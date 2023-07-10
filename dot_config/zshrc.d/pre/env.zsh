# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Go Paths
#export GOPATH=$(go env GOPATH)
#export GOBIN="$(go env GOPATH)/bin"
#export GOROOT=$(go env GOROOT)

export VISUAL=lvim
export EDITOR=$VISUAL

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE="/var/run/docker.sock"
export DOCKER_HOST="unix:///Users/tylercrawford/.docker/run/docker.sock"

