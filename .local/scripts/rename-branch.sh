#!/usr/bin/env bash
# https://stackoverflow.com/questions/30590083/how-do-i-rename-both-a-git-local-and-remote-branch-name


# Check if both arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <old_branch_name> <new_branch_name>"
    exit 1
fi

old_name="$1"
new_name="$2"
remote="origin"

# Rename the local branch to the new name
echo "git branch -m $old_name $new_name"
git branch -m "$old_name" "$new_name"
echo "-----"

# Delete the old branch on remote
echo "git push $remote --delete $old_name"
git push "$remote" --delete "$old_name"
echo "-----"

# Or shorter way to delete remote branch
# git push "$remote" :"$old_name"

# Prevent git from using the old name when pushing in the next step.
# Otherwise, git will use the old upstream name instead of <new_name>.
echo "git branch --unset-upstream $new_name"
git branch --unset-upstream "$new_name"
echo "-----"

# Push the new branch to remote
echo "git push $remote $new_name"
git push "$remote" "$new_name"
echo "-----"

# Reset the upstream branch for the new_name local branch
echo "git push $remote -u $new_name"
git push "$remote" -u "$new_name"
echo "-----"
