#!/usr/bin/env bash

command -v nmap &>/dev/null || { echo "nmap is not installed" ; exit 1 ; }

if [[ ! -d ./nmap_results ]] ; then mkdir ./nmap_results ; fi

nmap -oN ./nmap_results/output.txt -O -sS -sU -sV -p U:53,111,137,T:21,22,23,24,25,80,139,8080 "$1"

