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

# Header
printf -- '-%.0s' {1..65}
echo
printf '%s' "| LOOK AT WHAT YOU DID"
printf -- ' %.0s' {1..42}
printf '%s\n' "|"

# Change this variable to the parent folder of your repos
repos="$HOME/Projects/\#Repos/*"

shame=()

# For each directory in #Repos
for dir in ${repos}; do
  # If dir is a directory, cd into it and silence errors (for non-directories)
  cd "$dir" 2>/dev/null || exit
  # If directory is git repo, continue; else, next loop iteration
  if [ -d .git ]; then
    # If repo has commits since yesterday, continue; else, next loop iteration
    if [[ $(git log --pretty=format:'%h was %an, %ar, message: %s' --since="yesterday") ]]; then
      printf -- '-%.0s' {1..65}
      echo
      printf "// Repository: "
      # Print name of current directory removed from full filepath
      printf '%s\n' "${PWD##*/}"
      printf -- '-%.0s' {1..65}
      echo
      # Print git log since yesterday, show only commits
      git --no-pager log --since="yesterday" --pretty=tformat:"%x20*%x20%x20%s"
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
printf -- '-%.0s' {1..65}
echo
printf '%s' "| LOOK AT WHAT YOU DIDN'T DO"
printf -- ' %.0s' {1..36}
printf '%s\n' "|"
printf -- '-%.0s' {1..65}
echo
printf '%s\n' "// Unloved repositories: "
for id in "${shame[@]}"; do
  # printf -- '-%.0s' {1..65}
  # Print name of current directory removed from full filepath
  printf -- ' %.0s' {1..5}
  printf '%s\n' "${id}"
  # Print git log since yesterday, show only commits
  # printf -- '-%.0s' {1..65}
done
printf -- '-%.0s' {1..65}
echo
