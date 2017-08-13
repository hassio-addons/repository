#!/bin/bash

for addon in "$@";
do
  if [ -z $TRAVIS_COMMIT_RANGE ] || \
    git diff --name-only $TRAVIS_COMMIT_RANGE | grep -q $addon;
  then
	  archs=$(jq -r '.arch // ["armhf","amd64","aarch64","i386"] | .[]' ${addon}/config.json)
	  for arch in $archs
	  do
	    ./bin/create_hassio_addon.sh -a $arch -s $addon -l .
	  done
  else
	  echo "No change in commit range $TRAVIS_COMMIT_RANGE, skipping build."
  fi
done
