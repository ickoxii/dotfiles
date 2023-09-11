#!/opt/homebrew/bin/bash

# This script utilizes pandoc, entr, and skim (or other pdf/.html viewer) in
# order to create a live previewer for Markdown (.md) files.
# 
#   pandoc - command line file converter. in our script, we convert markdown to
#            pdf
#   entr - command line tool that checks when files are updated.
#   skim - (brew --cask) application, pdf viewer downloaded through homebrew

DEFAULT_APP="Preview"

# Function to handle the end of the preview
stop_preview() {
    echo "Stopping live preview..."
    kill $ENTR_PID
    exit
}

# Check argument count and assign appropriate variables
case $# in
    1)  
        if [[ $1 == *.md ]]; then
            MD_FILE=$1
            APP=$DEFAULT_APP
        else
            echo "Error: If providing one argument, it should be a markdown file."
            exit 1
        fi
        ;;
    
    2)
        if [[ $1 == *.md ]]; then
            MD_FILE=$1
            APP=$2
        else
            echo "Error: First argument should be a markdown file and second an application name."
            exit 1
        fi
        ;;
    
    *)
        echo "Usage: $0 markdown-file-name [application-to-view-live]"
        exit 1
        ;;
esac

PDF_FILE="${MD_FILE%.*}.pdf"
SCRIPT_END_PASSPHRASE="endpreview"

# Use entr to watch changes and recompile the markdown using pandoc
while true; do
    echo "$MD_FILE" | entr -d pandoc "$MD_FILE" -o "$PDF_FILE" &
    ENTR_PID=$!
    open -a "$APP" "$PDF_FILE"
    echo "Type $SCRIPT_END_PASSPHRASE and press enter to stop live preview, or edit the markdown to refresh the preview."
    read -p "Command: " cmd
    if [ "$cmd" = $SCRIPT_END_PASSPHRASE ]; then
        stop_preview
    fi
done

