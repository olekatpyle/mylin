export EDITOR=nvim
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export RANGER_LOAD_DEFAULT_RC=false
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d75fff"
export GOPATH="$HOME/go"

export PATH="$PATH:$GOPATH/bin:/home/$USER/.local/bin:/usr/local/texlive/2023/bin/x86_64-linux"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
