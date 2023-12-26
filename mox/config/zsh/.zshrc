# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.config/zsh/.oh-my-zsh"

ZSH_THEME="oni"

source $ZSH/oh-my-zsh.sh

PATH=$PATH:/home/$USER/.local/bin:/home/$USER/.local/scripts/9e-openbmc/netflix

plugins=(zsh-autosuggestions tmux timer)

HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500

setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
bindkey 'M-;' autosuggest-accept
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mox/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export LANG=de_DE.UTF-8
export LS_COLORS="$(vivid generate dracula)"

alias vim=nvim
# write into a temporary file
alias tvim='nvim /home/mox/.cache/notes.tmp'
# alias htop=htop -C
alias show=kitty +kitten icat
alias mylin='cd /home/mox/.local/repo/mylin/'
alias dev='cd /home/mox/.local/dev/'
alias scripts='cd /home/mox/.local/scripts/'
alias nvc="nvim ~/.config/nvim"
alias kssh="kitty +kitten ssh"
alias virt="cd /home/mox/.local/virtual/"
alias docs="cd /home/mox/.local/docs/"
alias 9e="cd /home/mox/.local/docs/9e"
alias z="zathura"
alias img="kitty +kitten icat"
alias h="hishtory tquery"
alias tasks=go-task

# Hishtory Config:
export PATH="$PATH:/home/mox/.hishtory"
source /home/mox/.hishtory/config.zsh
