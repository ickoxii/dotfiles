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
# Markdown Live Preview
# =====================

# Temporary files for tracking PIDs
WATCH_PID_FILE="/tmp/watch_pid"
EVINCE_PID_FILE="/tmp/evince_pid"

# ====================
# start_preview
# ====================
#
# Initiates the live markdown preview by watching for changes to the markdown file
# and displaying its PDF representation using Evince.
#
# Parameters:
#   $1 - Markdown file to be watched and converted to PDF.
#
# Assumptions:
#   Assumes `fswatch`, `pandoc`, and `evince` are available in the system.
#
# Usage:
# $ start_preview input.md
# -----------------------
start_preview() {
    local markdown_file="$1"
    local pdf_file="${markdown_file%.md}.pdf"
    
    # If the PDF file does not exist, create it
    if [ ! -e "$pdf_file" ]; then
        touch "$pdf_file"
    fi

    # Start watching the markdown file and converting it to PDF
    start_watch "$markdown_file" "$pdf_file" &
    echo $! > "$WATCH_PID_FILE"
    
    # Start the Evince PDF viewer
    start_evince "$pdf_file" &
    echo $! > "$EVINCE_PID_FILE"
}

# ====================
# stop_preview
# ====================
#
# Terminates the live markdown preview process. Stops both the markdown watch 
# and the Evince PDF viewer.
#
# Usage:
# $ stop_preview
# -----------------
stop_preview() {
    stop_watch
    stop_evince
}

# ====================
# start_watch
# ====================
#
# Uses `fswatch` to monitor changes to a given markdown file and, on modification,
# converts it to a PDF using `pandoc`.
#
# Parameters:
#   $1 - Markdown file to be watched.
#   $2 - PDF file to which the markdown will be converted.
#
# Usage:
# [Called internally by start_preview]
# -----------------
start_watch() {
    local markdown_file="$1"
    local pdf_file="$2"
    
    # Monitor changes to the markdown file and convert to PDF using pandoc
    fswatch -0 "$markdown_file" | while read -d "" event; do
        sleep 0.2
        pandoc "$markdown_file" -o "$pdf_file"
        echo "Markdown converted to PDF."
    done
}

# ====================
# stop_watch
# ====================
#
# Stops the markdown file watch process.
#
# Usage:
# [Called internally by stop_preview]
# -----------------
stop_watch() {
    if [ -f "$WATCH_PID_FILE" ]; then
        kill -9 $(cat "$WATCH_PID_FILE") 2>/dev/null
        rm "$WATCH_PID_FILE"
        echo "Markdown watch process stopped."
    fi
}

# ====================
# start_evince
# ====================
#
# Opens the provided PDF file in the Evince PDF viewer.
#
# Parameters:
#   $1 - PDF file to be viewed.
#
# Usage:
# [Called internally by start_preview]
# -----------------
start_evince() {
    local pdf_file="$1"
    
    evince "$pdf_file" &
    echo "Evince PDF viewer started."
}

# ====================
# stop_evince
# ====================
#
# Stops the running instance of the Evince PDF viewer.
#
# Usage:
# [Called internally by stop_preview]
# -----------------
stop_evince() {
    if [ -f "$EVINCE_PID_FILE" ]; then
        kill -9 $(cat "$EVINCE_PID_FILE") 2>/dev/null
        rm "$EVINCE_PID_FILE"
        echo "Evince PDF viewer stopped."
    fi
}
