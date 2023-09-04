#!/opt/homebrew/bin/bash

# This script backs up my configuration files then pushes changes to GitHub.
# Using an associative array to maintain source and destination mapping.

declare -A backups

BACKUP="$HOME/Documents/coding/mac-configuration-files/"

# Populate the associative array
backups["$HOME/.aliases"]="${BACKUP}.aliases.backup"
backups["$HOME/.bash_profile"]="${BACKUP}.bash_profile.backup"
backups["$HOME/.bash_prompt"]="${BACKUP}.bash_prompt.backup"
backups["$HOME/.vimrc"]="${BACKUP}.vimrc.backup"
backups["$HOME/.config/neofetch/config.conf"]="${BACKUP}config.conf.backup"
backups["$HOME/.config/spotifyd/spotifyd.conf"]="${BACKUP}spotifyd.conf.backup"
backups["$HOME/.config/spotify-tui/config.yml"]="${BACKUP}spotify-tui-config.yml.backup"
backups["$HOME/.hushlogin"]="${BACKUP}.hushlogin.backup"
backups["$HOME/.gitconfig"]="${BACKUP}.gitconfig.backup"

#*-- DATA BACKUP --*#
changes_made=false
declare -a changed_files

# Loop through the associative array
for SOURCE in "${!backups[@]}"; do
    DESTINATION="${backups[$SOURCE]}"

    # Check if source file exists
    if [[ ! -f "$SOURCE" ]]; then
        echo "Error: Source file $SOURCE does not exist."
        continue
    fi

    # Check for differences
    if diff "$SOURCE" "$DESTINATION" > /dev/null; then
        echo "File $(basename $SOURCE) is already backed up and has no changes."
    else
        cp "$SOURCE" "$DESTINATION"
        if [[ $? -eq 0 ]]; then
            changes_made=true
            changed_files+=("$SOURCE")  # Add changed file to list
            echo "File $(basename $SOURCE) has been updated in the backup directory"
        else
            echo "Error updating backup for $(basename $SOURCE)."
        fi
    fi  
done

#*-- BACKUP TO GITHUB --*#
if $changes_made; then
    cd $BACKUP
    for file in "${changed_files[@]}"; do
        rel_path=${file/#$HOME\//}  # Convert to relative path
        git add "$rel_path"
    done
    git commit -m "Updated configuration files"
    git push -u origin main
    echo "Updated files committed to GitHub."
else
    echo "No changes detected, no commit made to GitHub."
fi
