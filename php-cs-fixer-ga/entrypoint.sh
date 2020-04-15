#!/bin/sh -l

CHANGED_FILES=$(git diff master... --name-only)

if [[ -z "$CHANGED_FILES" ]]; then
   echo "No chnaged files have been commited"
   exit 0
fi

for file in $CHANGED_FILES ; do
    sh -c "/usr/local/bin/php-cs-fixer fix $file $*;"
done
