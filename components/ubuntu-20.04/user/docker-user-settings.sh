LIGHT_BROWN="\e[38;5;178m"
LIGHT_PURPLE="\e[38;5;135m"
LIGHT_BLUE="\e[38;5;43m"
LIGHT_GREEN="\e[38;5;46m"
COLOR_YELLOW="\e[38;5;229m"
BROWN="\[\033[1;33m\]"
COLOR_RESET="\[\033[0m\]"
COLOR_GREEN="\[\033[01;32m\]"
COLOR_ORANGE="\e[38;5;208m"
COLOR_RED="\e[38;5;161m"

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo " ($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo " ($commit)"
  fi
}

#https://coderwall.com/p/pn8f0g/show-your-git-status-and-branch-in-color-at-the-command-prompt
function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working tree clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $LIGHT_GREEN
  else
    echo -e $COLOR_ORANGE
  fi
}

function git_try_status {
    git rev-parse --is-inside-work-tree &> /dev/null && echo -e $(git_color)$(git_branch)
}

export -f git_branch git_color git_try_status

GIT_PSENTRY="\$(git_try_status)"
# https://stackoverflow.com/questions/20995351/how-can-i-get-docker-linux-container-information-from-within-the-container-itsel
DOCKER_CONTAINER=$(basename "$(cat /proc/1/cpuset)" | cut -c1-8)
DOCKER_PSENTRY="$LIGHT_PURPLE[$DOCKER_CONTAINER@$DOCKER_IMAGE_NAME]"
USERHOST_PSENTRY="$LIGHT_BLUE\u$COLOR_RESET@$COLOR_GREEN\h"
PWD_PSENTRY="$COLOR_YELLOW\w"
DEBIAN_CHROOT_PSENTRY="${debian_chroot:+($debian_chroot)}"
PS1="$DEBIAN_CHROOT_PS_ENTRY$DOCKER_PSENTRY $USERHOST_PSENTRY$COLOR_RESET$GIT_PSENTRY:$PWD_PSENTRY$COLOR_RESET\$ "