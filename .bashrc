# My ~/.bashrc
# very shit indeed but it is what it is

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
# some bs someone sent me
export PS1="\[\033[1;37m\]┌──╼\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;32m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;37m\]⇀\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;32m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;37m\]⇀\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;37m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[1;37m\]└╼\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[1;32m\]\[$(tput sgr0)\]"

export EDITOR=nano
export BASED=nano
export GPG_TTY=$(tty)

# base dirs

mkdir -p ~/Projects

# aliases

alias explore="nautilus . &"
alias dot="yadm"
alias hist='cat ~/.bash_history'
alias update='upd'

# sudowrappers & additional things

pacman() {
    # $1 for first arg, $2 for next etc
    # $@ for all args

    if [[ $1 == "autoremove" ]]; then
        sudo pacman -Qtdq | sudo pacman -Rns -
    elif [[ $1 == "update" ]]; then
        if [[ -z $2 ]]; then
            echo "W: Arguments ignored"
        fi
        sudo pacman -Syu
    elif [[ $1 == "aurdev" ]]; then
        if [[ -z $2 ]]; then
            echo "Usage: pacman aurdev <package name>"
            return
        fi
        mkdir -p ~/Projects/aur/$2
        cp /usr/share/pacman/PKGBUILD.proto ~/Projects/aur/$2/PKGBUILD
        cd ~/Projects/aur/$2/
        echo PKGBUILD created.
    else
        command sudo pacman "$@"
    fi
}

upd() {
  pacman update
  flatpak update --noninteractive
}

# env vars

export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j$(nproc)"
export CC=gcc
