#! /usr/bin/env bash
# ------------------------------------------------------------------
# OH MY GOD, WHAT DID YOU DO?!
# ------------------------------------------------------------------
# title          :omgwdyd.sh
# description    :Checks previous day's git commits
# author         :Timothy Merritt
# date           :2020-11-12
# version        :0.0.1
# usage          :./omgwdyd.sh
# notes          :chmod +x runfile.sh to make executable
# bash_version   :5.0.18(1)-release
# ------------------------------------------------------------------

# Clear screen
clear
figlet OMGWDYD

function header() {
  len=${#1}
  spacer=$((60 - ${len}))
  printf -- '┌%.0s' {1}
  printf -- '─%.0s' {1..63}
  printf -- '╖%.0s' {1}
  echo
  printf '%s' "│ $1"
  printf -- ' %.0s' $(seq "$spacer")
  printf '%s\n' "║"
  printf -- '╘%.0s' {1}
  printf -- '═%.0s' {1..63}
  printf -- '╝%.0s' {1}
  echo
}

function repo_header() {
  printf -- '┌%.0s' {1}
  printf -- '─%.0s' {1..64}
  echo
  printf "│ // ${1}"
  printf '%s\n' "${2}"
  printf -- '├%.0s' {1}
  printf -- '─%.0s' {1..64}
  echo
}

# Change this variable to the parent folder of your repos
repos="$HOME/Projects/\#Repos/*"

# Array for repos with no commits in 24 hours
shame=()
header "LOOK AT WHAT YOU DID ༼ つ ◕ ▽ ◕ ༽つ ｡･:*:･ﾟ★ ｡･:*:･ﾟ☆"
for dir in ${repos}; do
  # If dir is a directory, cd into it and silence errors (for non-directories)
  cd "$dir" 2>/dev/null || exit
  # If directory is git repo, continue; else, next loop iteration
  if [ -d .git ]; then
    # If repo has commits since yesterday, continue; else, add repo to ${shame}, next loop iteration
    if [[ $(git log --pretty=format:'%h was %an, %ar, message: %s' --since="yesterday") ]]; then
      repo_header "Repository: " "${PWD##*/}"
      # Print git log since yesterday, show only commits
      git --no-pager log --since="yesterday" --pretty=tformat:"│%x20%x20*%x20%x20%s"
    else
      shame+=("${PWD##*/}")
      continue
    fi
  else
    # cd back to #Repos
    cd ..
    continue
  fi
  cd ..
done

# Show repos with NO commits in past 24 hours
header "LOOK AT WHAT YOU DIDN'T DO ༼ つ ◕ _ ◕ ༽つ  . . . . . . . "
repo_header "Repositories with 0 commits"
for id in "${shame[@]}"; do
  printf '%s' "│"
  printf -- ' %.0s' {1..4}
  printf '%s\n' "${id}"
done
echo
