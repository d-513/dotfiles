# My ~/.bashrc
eval "$(starship init bash)"
source ~/.profile
# very shit indeed but it is what it is

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias explore="nautilus . &"
alias dot="yadm"
alias update='upd'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
pacman() {
    # $1 for first arg, $2 for next etc
    # $@ for all args

    if [[ $1 == "autoremove" ]]; then
        sudo pacman -Qtdq | sudo pacman -Rns -
    elif [[ $1 == "update" ]]; then
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

