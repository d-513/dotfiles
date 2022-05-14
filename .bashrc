# My ~/.bashrc
eval "$(antidot init)"
# very shit indeed but it is what it is

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'


# PROMPT

MAIN_COLOR="\[\033[38;5;27m\]";
SECONDARY_COLOR="\[\033[38;5;25m\]";
ACCENT_COLOR="\[\033[38;5;75m\]";
ACCENT2_COLOR="\[\033[38;5;248m\]";
TEXT_COLOR="\[\033[38;5;253m\]";

PROMPT_COMMAND='pwd2=$(sed "s:\([^/]\)[^/]*/:\1/:g" <<<$PWD);\
gitbranch=$(git branch 2>/dev/null | grep '^*' | cut -c 2-);\
FIRST_LINE="$MAIN_COLOR┌───( $ACCENT_COLOR$USERNAME $MAIN_COLOR)-[ $ACCENT2_COLOR$pwd2 $MAIN_COLOR]"; \
SECOND_LINE="│$SECONDARY_COLOR \d \t $MAIN_COLOR"; \
LAST_LINE="└─$gitbranch$ACCENT_COLOR > $TEXT_COLOR"; \
PS1="${FIRST_LINE}\r\n${SECOND_LINE} \r\n${LAST_LINE}" '

# ENV

export EDITOR=nano
export BASED=nano
export GPG_TTY=$(tty)
export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="$CFLAGS"
export MAKEFLAGS="-j$(nproc)"
export CC=gcc


# base dirs

mkdir -p ~/Projects

# aliases

alias explore="nautilus . &"
alias dot="yadm"
alias hist='cat ~/.bash_history'
alias update='upd'
alias docker='sudo docker'

# sudowrappers & additional things

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

