#!/usr/bin/env bash

project="${HOME}/baylor/projects/PrimeTimePets"

cd ${project} || exit

current_branch=$(git branch --show-current)
branches=$(git --no-pager branch | grep -v 'main' | sed "s/\*//" | awk '{print $1}')

echo $branches
echo $current_branch

# Stash current changes
git stash

git checkout main
git fetch --all && git pull origin main

for branch in ${branches}; do
    git checkout ${branch}
    git stash
    if ! git merge main; then
        git merge --abort
        osascript -e "display dialog \"Merge failed for branch: ${branch}\"" &
    fi
    git stash pop
done

git stash pop

git checkout ${current_branch}
