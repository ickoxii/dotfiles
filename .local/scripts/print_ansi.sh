#!/usr/bin/env bash
# This script loops through the extended 256 ANSI colors

# Default to 4 columns, using command line argument if specified
columns=${1:-4}

# Calculate the number of rows needed
rows=$(( (255 + columns) / columns ))

for row in $(seq 0 $((rows - 1))); do
    for col in $(seq 0 $((columns - 1))); do
        color=$((row + col * rows))
        if [ $color -le 255 ]; then
            printf "Color code: \e[38;5;${color}m%3d \e[48;5;${color}m    \e[0m  " $color
        else
            printf "%-38s" " "  # Empty space for padding
        fi
    done
    echo  # New line after each row
done
