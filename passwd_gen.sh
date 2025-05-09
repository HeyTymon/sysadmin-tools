#!/usr/bin/env bash

if [[ -z "$1" || "$1" -lt 1 ]] ; then len=10 ; else len="$1" ; fi

base='A-Za-z'

if [[ -n "$2" ]] ; then
 case "$2" in
  1) base="${base}0-9" ;;
  2) base="${base}!@#$%^&*()-_=+[]{}|;:,.<>?" ;;
  3) base="${base}0-9!@#$%^&*()-_=+[]{}|;:,.<>?" ;;
  *) echo "Invalid argument" ;;
 esac
fi

echo $(tr -dc "${base}" < /dev/urandom | head -c "$len")
