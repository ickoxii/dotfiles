#!/usr/bin/env bash

# Check if file argument
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filename> <columns>"
    exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
    echo "File '$1' not found"
    exit 1
fi

# Replace ',,' with ', ,' and cat w/ columns
column -s, -t < "$1" | less -#50 -N -S
