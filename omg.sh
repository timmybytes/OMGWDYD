#!/usr/bin/env bash
#title          :omg.sh
#description    :Check git updates from the last 24 hours
#author         :Timothy Merritt
#date           :2021-07-04
#version        :0.1.0
#usage          :./omg.sh
#notes          :
#bash_version   :5.1.8(1)-release
#============================================================================

# Get repo location(s) - based on .omgrc
repos=''

# Check if inside a git repo: True/False
is_git=$(git rev-parse --is-inside-work-tree)

# Get repo name
repo_name=$(basename $(git rev-parse --show-toplevel))

# Get branch name
branch_name=$(git branch | grep '^*' | cut -d ' ' -f 2)
