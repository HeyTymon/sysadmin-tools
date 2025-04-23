#!/usr/bin/env bash

display_help() {
 echo "Usage: $0 [OPTIONS]"
 echo "  -s   Source path to bakcup"
 echo "  -d   Destination path of the backup"
 echo "  -c   Change compresion algoritm to bzip2 - default is gzip"
 echo "  -h   Display help"
}

source=""
destination=""
c_type=0

while getopts 's:d:ch' opt 2>/dev/null; do
 case "${opt}" in
  s) source="${OPTARG}" ;;
  d) destination="${OPTARG}" ;;
  c) c_type=1 ;;
  h) display_help ; exit 0 ;;
  ?) "Invalid parameter" ; exit 1 ;;
 esac
done

#if [[ -z "${source}" || -z "${destination}" ]]; then echo "Set source and destaination path (-s, -d)" ; exit 1 ; fi 
cd "${destiantion}" && cd "${source}" || exit 1

arr=($(date))
date_str="${arr[1]}-${arr[2]}-${arr[-1]}"

for d in $(ls -d */); do
 d_mod="${d// /_}"
 echo "Backing up ${d_mod}"
 if [[ " ${c_type}" -eq 0 ]]; then
  tar -czf "${destination}/backup-${d_mod%/}-${date_str}.tar.gz" "$d/"
 else
  tar -cjf "${destination}/backup-${d_mod%/}-${date_str}.tar.bz2" "$d/"
 fi
done

#todo
if [[ $(ls -p | grep -v / -c) -gt 1 ]] ; then
# find . -type f -exec tar --transform 's|^./||' -rf "${destination}/backup-files-${date_str}-custom.tar.bz2" {} +
# find . -type f -exec tar -rf "${destination}/backup-files-${date_str}-custom.tar.bz2" {} +
fi
