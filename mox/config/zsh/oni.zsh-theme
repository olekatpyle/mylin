# daivasmara.zsh-theme, based on smt

MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="   "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[red]%} !%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✓%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %F{171}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%F{120}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%F{227}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%F{203}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%F{123}"

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function git_time_since_commit() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        # Only proceed if there is actually a commit.
        if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
            # Get the last commit.
            last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
            now=`date +%s`
            seconds_since_last_commit=$((now-last_commit))

            # Totals
            MINUTES=$((seconds_since_last_commit / 60))
            HOURS=$((seconds_since_last_commit/3600))

            # Sub-hours and sub-minutes
            DAYS=$((seconds_since_last_commit / 86400))
            SUB_HOURS=$((HOURS % 24))
            SUB_MINUTES=$((MINUTES % 60))

            if [[ -n $(git status -s 2> /dev/null) ]]; then
                if [ "$MINUTES" -gt 30 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG"
                elif [ "$MINUTES" -gt 10 ]; then
                    COLOR="$ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM"
                else
                    COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT"
                fi
            else
                COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            fi

            if [ "$HOURS" -gt 24 ]; then
                echo "[$COLOR${DAYS}d${SUB_HOURS}h${SUB_MINUTES}m%{$reset_color%}]"
            elif [ "$MINUTES" -gt 60 ]; then
                echo "[$COLOR${HOURS}h${SUB_MINUTES}m%{$reset_color%}]"
            else
                echo "[$COLOR${MINUTES}m%{$reset_color%}]"
            fi
        else
            COLOR="$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL"
            echo "[$COLOR~]"
        fi
    fi
}

function node_prompt_version {
    if [[ -e "package.json" ]]; then
        echo "%B%F{015}$NODE %b$(node -v)%k%F{000}%b"
    fi
}

function venv_info_prompt {
    if [[ -v VIRTUAL_ENV ]]; then
        echo "%F{228}$PYTHON %F{015}${VIRTUAL_ENV##*/}"
    fi
}

function git_branch_name {
    if [[ -e .git ]]; then
        BRANCH="$(git branch --show-current)"
        if [[ ${#BRANCH} > 16 ]]; then
            BRANCH="$(cut -c 1-15 <<< $BRANCH)"
        fi
        echo " $GIT_BRANCH $BRANCH "
    fi
}

function prompt_status {
    echo "%(?.%F{157}$OK.%F{204}$ERR %F{015}[%?])"
}

OK=$'\uf058'
ERR=$'\uf188'
SEP_L=$'\ue0b6'
SEP_R=$'\ue0b4'
ITA=$'\e[3m'
NODE=$'\ue718'
PYTHON=$'\uf81f'
GIT_BRANCH=$'\ue0a0'

# BLACK
PROMPT='
 %F{000}$SEP_L${ITA}%F{171}%K{000}%n@ %F{015}%1~ %F{000}%k$SEP_R%f $(prompt_status) %B%F{171}$%b%k%f '

# WHITE
# PROMPT='
#   %F{015}$SEP_L${ITA}%F{000}%K{015}%n @ %F{198}%1~$(node_prompt_version)$(venv_info_prompt)%F{015}%k$SEP_R%f $(prompt_status) %B%F{198}$%b%k%f '

RPROMPT='$(git_prompt_short_sha)$(git_branch_name)$(git_prompt_status)%{$reset_color%}'
