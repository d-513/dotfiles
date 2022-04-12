#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
export PS1="\[\033[1;37m\]┌──╼\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;32m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;37m\]⇀\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;32m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;37m\]⇀\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;37m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[1;37m\]└╼\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;32m\]\[$(tput sgr0)\]"

export EDITOR=nano
export GPG_TTY=$(tty)
alias explore="nautilus . &"
alias dot="yadm"
pacman() {
    if [[ $@ == "autoremove" ]]; then
        sudo pacman -Qtdq | sudo pacman -Rns -
    else
        command pacman "$@"
    fi
}
upd() {
  sudo pacman -Syu
  flatpak update --noninteractive
}

lsdesktop() {
  ls -F ~/.local/share/applications/
  ls -F /usr/share/applications/
}

rmdesktop() {
  if [ -z "$1" ]; then
    echo No name provided!
    return 1
  fi
  ln -s /dev/null ~/.local/share/applications/$1
}

# COMPILE

export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j20"
export CC=gcc
#export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock

alias pkgbuildhere='cp /usr/share/pacman/PKGBUILD.proto ./PKGBUILD'
alias hist='cat ~/.bash_history'
alias rcedit='$EDITOR ~/.bashrc'
