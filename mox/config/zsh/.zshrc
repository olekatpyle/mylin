# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.config/zsh/.oh-my-zsh"

ZSH_THEME="oni"

source $ZSH/oh-my-zsh.sh

PATH=$PATH:/home/$USER/.local/bin

plugins=(tmux timer)

HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500

setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mox/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export LANG=de_DE.UTF-8
export LS_COLORS="$(vivid generate gruvbox-dark)"

alias vim=nvim
alias htop=htop -C
alias show=kitty +kitten icat
alias mylin='cd /home/mox/.local/repo/mylin/'
alias dev='cd /home/mox/.local/dev/'
alias nvc="nvim ~/.config/nvim"
alias kssh="kitty +kitten ssh"
alias virt="cd /home/mox/.local/virtual/"
alias docs="cd /home/mox/.local/docs/"
alias 9e="cd /home/mox/.local/docs/9e/ && nvim index.norg"
alias z="zathura"
alias img="kitty +kitten icat"
