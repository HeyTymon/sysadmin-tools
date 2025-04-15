#!/usr/bin/env bash

display_help() {
 echo "Help for $0:"
 echo "-p  path to repository"
 echo "-m  message of the commit"
 echo "-b  branch"
 echo "-r  remote"
}

path=$(pwd)
message="Automatic commit #$(date +%d-%m-%Y_%H:%M)"
branch="main"
remote="origin"

while getopts 'p:m:b:r:h' opt 2>/dev/null ; do
 case "$opt" in
  p) path="${OPTARG}" ;;
  m) message="${OPTARG}" ;;
  b) branch="${OPTARG}" ;;
  r) remote="${OPTARG}" ;;
  h) display_help ; exit 0 ;;
  ?) echo "Invalid argument" ; exit 1 ;;
 esac
done

command -v git &>/dev/null || { echo "Git is not installed" ;  exit 1; }

cd "${path}" || { echo "${path} is invalid path" ;  exit 1; }

git rev-parse --is-inside-work-tree &>/dev/null || { echo "Repository not initialized in ${path}"; exit 1; }

if [[ -z "$(git status --porcelain)" ]]; then echo "Not changes to commit" ; exit 0 ; fi

IFS=$'\n'
read -d '' -r -a remotes < <(git remote)
read -d '' -r -a branches < <(git branch --format '%(refname:short)') #Skip * in the name of the current branch

#TODO - Check if arrays conatins users provided values

git add -A
git commit -m"${message}"
git push "${remote}" "${branch}"

