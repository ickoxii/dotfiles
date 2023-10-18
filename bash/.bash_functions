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

declare -A apps
# NOTE: we do not need to delimit spaces, i.e. ` ` instead of `\ `
apps[chrome]="Google Chrome"
apps[matlab]="MATLAB_r2023a"
apps[browser]="Brave Browser"
apps[brave]="Brave Browser"
apps[msg]="Messages"
apps[word]="Microsoft Word"

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
openapp() {
    # Use mapped name if it exists
    app_name="${apps[$1]:-$1}"

    open -a "$app_name"
}

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
    # Use mapped name if it exists
    app_name="${apps[$1]:-$1}"

    osascript -e "tell application \"$app_name\" to quit"
}
# END APPLICATION SHORTCUTS
# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# OPEN BAYLOR CSI PROJECTS SHORTCUTS


proj() {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        open -a "Brave Browser" "https://cs.baylor.edu/~hamerly/courses/3334_23f/project$1/"
    else
        echo "Invalid Argument."
    fi
}

# END BAYLOR CSI PROJECTS SHORTCUTS
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
