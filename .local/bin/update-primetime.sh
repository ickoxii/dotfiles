#!/usr/bin/env bash

project="${HOME}/baylor/projects/PrimeTimePets"

echo -e "Log for $(date '+%Y-%m-%d %H:%M:%S')"

cd ${project} || exit

current_branch=$(git branch --show-current)
branches=$(git --no-pager branch | grep -v 'main' | sed "s/\*//" | awk '{print $1}')

# Stash current changes
git stash

git checkout main
git fetch --all && git pull origin main

for branch in ${branches}; do
    echo -e "\033[0;34mChecking out into ${branch}\033[0m"
    git checkout ${branch}
    git stash
    if git merge main; then
        echo -e "  \033[0;32mMerged main into branch: ${branch}\033[0m"
    else
        git merge --abort
        echo -e "  \033[0;31mMerge failed for branch: ${branch}\033[0m"
    fi
    git stash pop
done

git stash pop

echo -e "Going back to branch ${current_branch}"
git checkout ${current_branch}
echo "--------------------"
