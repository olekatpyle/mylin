# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.config/zsh/.oh-my-zsh"

ZSH_THEME="oni"

source $ZSH/oh-my-zsh.sh

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
# store zcompdump in cache
compinit -d $HOME/.cache/zsh/zcompdump-$ZSH_VERSION
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
alias sc='cd /home/mox/.local/scripts/'
alias nvc="nvim ~/.config/nvim"
alias kssh="kitty +kitten ssh"
alias virt="cd /home/mox/.local/virtual/"
alias docs="cd /home/mox/.local/docs/"
alias 9e="cd /home/mox/.local/docs/9e"
alias z="zathura"
alias img="kitty +kitten icat"
alias h="hishtory tquery"
alias tasks=go-task
alias orga="nvim /home/mox/.local/docs/index.norg"

# Hishtory Config:
export PATH="$PATH:/home/mox/.hishtory"
source /home/mox/.hishtory/config.zsh
HISHTORY_SERVER=http://dev.olekatpyle.site.example.com
