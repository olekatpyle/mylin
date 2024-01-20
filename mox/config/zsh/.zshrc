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

export EDITOR=nvim
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:$HOME/.local/bin:/usr/local/texlive/2023/bin/x86_64-linux"
export MANPATH=$MANPATH:/usr/local/texlive/2023/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2023/texmf-dist/doc/info

export RANGER_LOAD_DEFAULT_RC=false
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#222222"

# Hishtory Config:
export PATH="$PATH:/home/mox/.hishtory"
source /home/mox/.hishtory/config.zsh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
