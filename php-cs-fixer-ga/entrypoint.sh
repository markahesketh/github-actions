#!/bin/sh -l


if [[ -z "$FILES" ]]; then
   echo "No chnaged files have been commited"
   exit 0
fi

IFS='FILE:|'
for file in $FILES ; do
  if [[ -z "$file" ]]; then
   continue
  fi
    sh -c "/usr/local/bin/php-cs-fixer fix $file $*;"
done
