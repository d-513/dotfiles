export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export PATH="$(yarn global bin):$PATH"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

export EDITOR=nano
export GPG_TTY=$(tty)
export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j$(nproc)"
export CC=gcc
export HSA_OVERRIDE_GFX_VERSION=10.3.0
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock

# Added by Toolbox App
export PATH="$PATH:/home/szsob/.local/share/JetBrains/Toolbox/scripts"
