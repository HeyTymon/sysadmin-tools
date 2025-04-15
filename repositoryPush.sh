#!/usr/bin/env bash

path=$(pwd)
message="Automatic commit #$(date +%d-%m-%Y_%H:%M)"

while getopts 'p:m:' opt 2>/dev/null ; do
 case "$opt" in
  p) path="${OPTARG}" ;;
  m) message="${OPTARG}" ;;
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

#echo "${remotes[@]} : ${branches[@]}"

git add -A
git commit -m"${message}"
git push

#TODO
#git fetch origin - synchro remote and local branches + user choice where to push chaneges


