#!/usr/bin/env bash

command -v namp 2>&1 || { echo "nmap is not installed" ; exit 1 }

nmap -oN ./nmap_results/essa.txt -O -sS -sU -sV -p U:53,111,137,T:21,22,23,24,25,80,139,8080 $1

