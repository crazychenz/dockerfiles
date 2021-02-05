COLOR_LIGHT_BROWN="\e[38;5;178m"
COLOR_LIGHT_PURPLE="\e[38;5;135m"
COLOR_LIGHT_BLUE="\e[38;5;87m"
COLOR_LIGHT_GREEN="\e[38;5;78m"
COLOR_LIGHT_YELLOW="\e[38;5;229m"
COLOR_YELLOW="\e[38;5;184m"
COLOR_BROWN="\e[\033[1;33m"
COLOR_RESET="\e[\033[0m"
COLOR_GREEN="\e[38;5;83m"
COLOR_ORANGE="\e[38;5;208m"
COLOR_RED="\e[38;5;167m"
COLOR_GRAY="\e[38;5;243m"

# Helper for showing colors in user specific terminal window+profile.
function show_colors {
    python <<PYTHON_SCRIPT
import sys
for i in range(0, 16):
    for j in range(0, 16):
        code = str(i * 16 + j)
        sys.stdout.write(u"\u001b[38;5;" + code + "m " + code.ljust(4))
    print u"\u001b[0m"
PYTHON_SCRIPT
}

# Inspired by:
# https://coderwall.com/p/pn8f0g
function git_branch {
  git rev-parse --is-inside-work-tree &> /dev/null
  if [ "$?" -eq "0" ]; then
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ ! $git_status =~ "working tree clean" ]]; then
        COLOR=$COLOR_RED
    elif [[ $git_status =~ "Your branch is ahead of" ]]; then
        COLOR=$COLOR_YELLOW
    elif [[ $git_status =~ "nothing to commit" ]]; then
        COLOR=$COLOR_LIGHT_GREEN
    else
        COLOR=$COLOR_ORANGE
    fi

    if [[ $git_status =~ $on_branch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo -e "$COLOR($branch) "
    elif [[ $git_status =~ $on_commit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo -e "$COLOR($commit) "
    fi
  fi
}
export -f git_branch

function get_prompt_date {
    echo -e "$COLOR_GRAY$(date +%Y-%m-%d-%H:%M:%S)"
}
export -f get_prompt_date

# Inspired by:
# https://stackoverflow.com/questions/20995351
function get_docker_ident {
    DOCKER_CONTAINER=$(basename "$(cat /proc/1/cpuset)" | cut -c1-8)
    DOCKER_IDENT="[$DOCKER_CONTAINER@$DOCKER_IMAGE_NAME]"
    if [ "$DOCKER_IDENT" == "[/@]" ]; then
        echo ""
    else
        echo -e "$COLOR_LIGHT_PURPLE$DOCKER_IDENT "
    fi
}
export -f get_docker_ident

USERHOST_PSENTRY="$COLOR_LIGHT_BLUE\u$COLOR_GRAY@$COLOR_GREEN\h "
PS1="${debian_chroot:+($debian_chroot)}$USERHOST_PSENTRY"
PS1="$PS1\$(get_docker_ident)\$(git_branch)\$(get_prompt_date)"
PS1="$PS1\n$COLOR_LIGHT_YELLOW\w$COLOR_RESET\$ "
