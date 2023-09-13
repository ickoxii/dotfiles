#!/opt/homebrew/bin/bash

# =====================
# Markdown Live Preview
# =====================
# This function uses a combination of fswatch, pandoc, evince, some vim
# autocommands, and a little bit of aliasing to achieve a live markdown
# previewer on macOS. On Linux, `inotify` tools can be used in place of 
# `fswatch`. 
#
# startwatch() - bash function that checks what file we are currently going to
#                pandoc, then calls onmodify.
# onmodify() - bash function that uses `fswatch` to check whenever `/tmp/bufwrite`
#            is modified. This modification is our signal to start our event.
#            The event that is called is using `pandoc` to convert our markdown
#            file to pdf.
# fswatch (brew) - command line tool that watches a path and performs an action
#                  whenever a file in that path is changed. In our case, when a
#                  file is changed, it will be `pandoc`-ed into a pdf.
# pandoc (brew) - command line file type converter. In our case, we will be
#                 converting markdown to pdf. Pandoc also hosts a variety of
#                 other file types, including but not limited to: .html, .docx,
#                 and .tex.
# evince (brew) - pdf viewer that automatically reloads when a pdf is changed.
#                 Apple's default pdf viewer, 'Preview,' also automatically
#                 reloads when a pdf is changed, but does so both slower and
#                 more inconsistly.
# vim autocommands - we will implement an autocommand that touches (updates the
#                    modification time of) the file `/tmp/bufwrite` every time
#                    you save a file a .md in Vim. Whenever this file is
#                    touched, pandoc will convert your markdown file to a pdf.
# bash aliases - I don't want the onmodify function to be constantly checking
#                whenever my terminal is up, so I've taken the liberty of adding
#                a couple bash aliases to start and stop the `onmodify()`
#                function.
#
# Note: No data is actually written to `/tmp/bufwrite`. The file is merely
# touched. If the file was not there already, it will be created. Otherwise, the
# modification time will be updated. `fswatch` (or `inotifywait` on Linux), then
# checks if this file is changed, which will trigger an event (pandoc-ing a
# markdown file to pdf).

# ----------
# startwatch
#
# Helper function to call onmodify with correct pandoc parameters. Initiates
# watching /tmp/bufwrite. Upon changes, it converts a given Markdown file to PDF
# using pandoc.
# 
# parameters:
#   $1 - First command line argument. Should be the name of the .md file.
#   $2 - Optional second command line argument. If provided, should be the name
#        of the .pdf file.
#
# return: none
# ------------
startwatch() {
    # The source file is the first argument
    local src="$1"

    # If the second argument is not provided, use the base name of the source
    # file as the base name of the pdf
    local dest="${2:-$(basename "$src" .md)}.pdf"
   
    # Call onmodify() (below) watching /tmp/bufwrite and converting the source
    # Markdown file to PDF when changes are detected
    # Also, store onmodify's PID to terminate the process later.
    onmodify /tmp/bufwrite "pandoc '$src' -o '$dest'" & echo $! > ~/.onmodify_pid
}

# --------
# onmodify
#
# Checks if the target file /tmp/bufwrite is modified. If modified, executes the
# event. (which in our case will be the command passed when onmodify is called
# from startwatch above).
# -----------------------
onmodify() {
    # Get the target to watch. Default to the current directory if none is
    # provided
    local TARGET=${1:-.}; 
    local CMD
    local PREAMBLE="$HOME/.dotfiles-and-scripts/latex/preambles"

    # Shift the arguments to capture the rest of the arguments as command to
    # execute
    shift
    CMD="$@"

    # Replace any instance of pandoc to include the math.tex preamble
    CMD="${CMD/pandoc /pandoc --include-in-header=$PREAMBLE/math.tex }"

    # Print out what the function is monitoring and the command it will execute
    echo "Watching: $TARGET | Command: $CMD"

    # Use fswatch to monitor the TARGET.
    # When a change is detected, wait a brief moment, then execute the CMD
    fswatch -0 "$TARGET" | while read -d "" event; do
        sleep 0.2
        bash -c "$CMD"
        echo
    done
}

# ==================================
# Open Evince in Background With PID
# ==================================

# -----------
# startevince
#
# Starts Evince in the background while saving the processes PID to
# /tmp/evince_pids. Saves both the pdf file name and process PID so that if
# multiple evince processes are concurrently running in the background, we can
# specify which one to kill.
#
# Usage:
# $ startevince pdf-name.pdf
# --------------------------
startevince() {
    evince "$@" &
    local pid=$!
    echo "$pid:$1" >> /tmp/evince_pids
}

# ----------
# stopevince
#
# Usage:
# $ stopevince
# $ stopevince pdf-name.pdf
#
# If no file names are provided, stopevince kills the latest evince process.
# Otherwise, it kills the evince process associated with 'pdf-name.pdf'.
# ----------------------------------------------------------------------
stopevince() {
    # Check if the file that stores the PIDs exists.
    if [ ! -f /tmp/evince_pids ]; then
        echo "No evince PIDs found"
        return
    fi

    # If a filename is provided as an argument to the function
    if [ "$#" -eq 1 ]; then
        local target_file="$1"

        # Search for the given filename in the PID file.
        # This line contains both the PID and the filename, separated by a colon.
        local line=$(grep ":$target_file$" /tmp/evince_pids)

        # Extract the PID from the line.
        local pid_to_kill=$(echo "$line" | awk -F':' '{print $1}')

        # If the PID is not found for the given filename
        if [ -z "$pid_to_kill" ]; then
            echo "No evince process found for $target_file"
            return
        fi

        # Kill the process with the found PID
        kill -9 "$pid_to_kill" 2>/dev/null

        # Remove the line with the PID and filename from the PID file.
        sed -i "/:$target_file$/d" /tmp/evince_pids

        # Inform the user about the killed process
        echo "Killed evince process $pid_to_kill for file $target_file"
    else
        # If no filename is provided, we'll kill the most recent evince process.

        # Get the last line from the PID file.
        local line=$(tail -1 /tmp/evince_pids)

        # Extract the PID and filename from the last line.
        local last_pid=$(echo "$line" | awk -F':' '{print $1}')
        local last_file=$(echo "$line" | awk -F':' '{print $2}')

        # Kill the most recent process.
        kill -9 "$last_pid" 2>/dev/null

        # Remove the last line from the PID file.
        sed -i '$d' /tmp/evince_pids

        # Inform the user about the killed process.
        echo "Killed evince process $last_pid for file $last_file"
    fi

    # Check if there are any remaining PIDs.
    local remaining=$(wc -l < /tmp/evince_pids)
    if [ "$remaining" -eq 0 ]; then
        # If no PIDs remain, delete the PID file.
        rm /tmp/evince_pids
        echo "No more evince processes running."
    else
        echo "$remaining evince processes left."
    fi
}
