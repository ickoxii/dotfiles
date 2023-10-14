#!/opt/homebrew/bin/bash

# .bash_functions
# Author: Icko Iben
# Created on: Fri; 15 Sep 2023; 07:04 CDT
# Last Modified: Fri; 15 Sep 2023; 07:04 CDT
# Description: Contains bash functions

# DEBUG
# echo "in .bash_functions"

# --------------------------------------------------------------------------- #
# =====================
# Application Shortcuts
# =====================

# Declare Global Nicknames using an associative array (Bash 4.0 or later)
# Check using `echo $BASH_VERSION` or `bash --version`
# In .bashrc
#declare -A app_names
#app_names=(
#    ["matlab"]="open -a MATLAB_r2023a"
#    ["spotify"]="Spotify"
#    ["browser"]="Brave\ Browser"    # Default browser application
#    ["brave"]="Brave\ Browser"
#    ["chrome"]="Google\ Chrome"
#    ["discord"]="Discord"
#)

# ===================
# openapp
# ===================
#
# ***JUST USE open -a BRUH***
# Opens an application using `open -a`
#
# Parameters:
#   $1 - First command line argument
#        Name of our application (or nickname)
# 
# Return: None
# -------------------
#openapp() {
    # Check if nickname exists, otherwise use name provided    
#   app_to_open="${app_names[$1]:-$1}"
#
    # If only wanting to use openapp only on applications with nicknames
#   if [[ -z $app_to_open ]]; then
#       echo "Unknown app nickname (or name): $1"
#       return 1
#   fi
#
#   open -a "$app_to_open"
#}

# ===================
# close
# ===================
#
# Closes the given application using `osascript -e`
#
# Parameters:
#   $1 - First command line argument
#        Name of our application (or nickname)
#
# Return: None
# -------------------
close() {
    # Check if nickname exists, otherwise use name provided
    app_to_close="${app_names[$1]:-$1}"

    # If only wanting to use openapp only on applications with nickname
#   if [[ -z $app_to_close ]]; then
#       echo "Unknown app nickname (or name): $1"
#       return 1
#   fi

    osascript -e "tell application \"$app_to_close\" to quit"
}
# END APPLICATION SHORTCUTS
# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# =====================
# Markdown Live Preview
# =====================

ONMODIFY_PID_FILE=".onmodify_pid"

# ====================
# start_preview
# ====================
#
# Initiates the live markdown preview by opening the PDF in Evince and starting
# the watch process on the markdown file.
#
# Parameters:
#   $1 - Markdown file to be watched.
#   $2 - PDF file to be opened in Evince.
#
# Assumptions:
#   Assumes `fswatch`, `pandoc`, and `evince` are available in the system.
#
# Usage:
# $ start_preview input.md output.pdf
# -----------------------
start_preview() {
    local md_file="$1"
    local pdf_file="$2"

    # Open PDF in a background evince process
    #evince "$pdf_file" &

    # Start the watch process using onmodify
    onmodify /tmp/bufwrite "pandoc '$md_file' \
    --include-in-header=$PREAMBLE/math.tex --highlight-style=pygments -o \
    '$pdf_file'" &
    echo $! > $ONMODIFY_PID_FILE # Record the PID of the onmodify function
}

# ====================
# onmodify
# ====================
#
# Watches for changes to a target (default is current directory).
# When changes are detected, it executes the provided command.
#
# Parameters:
#   $1 - Target file or directory to watch.
#   $@ - Command to execute upon detected changes.
#
# Assumptions:
#   Assumes `fswatch` is available in the system.
#
# Usage:
# $ onmodify /path/to/watch "command to execute"
# -------------------
onmodify() {
    local TARGET=${1:-.}; shift
    local CMD="$@"

    echo "Watching: $TARGET | Command: $CMD"

    fswatch -0 "$TARGET" | while read -d "" event; do
        sleep 0.2
        bash -c "$CMD"
        echo "in fswatch loop"
        echo
    done
}

# ====================
# stop_preview
# ====================
#
# Stops all ongoing background evince processes.
#
# Usage:
# $ stop_preview
# -----------------------
stop_preview() {
    #pkill evince
    echo "All evince processes stopped."

    # Kill onmodify background process
    if [ -f $ONMODIFY_PID_FILE ]; then
        kill -9 $(cat $ONMODIFY_PID_FILE) 2>/dev/null
        rm $ONMODIFY_PID_FILE
        echo "onmodify process stopped."
    fi

    echo "All evince processes and onmodify stopped."
}
# END: PANDOCMARKDOWN
# --------------------------------------------------------------------------- #
