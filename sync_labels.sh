#!/bin/bash

repos=$(<repos2sync)

if ! type labels >/dev/null 2>&1
then
  echo "Command labels not found. Is it installed?"
  exit 1
fi

for repo in $repos
do
  echo "Syncing repo ${repo}"
  labels sync -f labels.toml -r $repo
done

echo "Finished syncing lables."

