#!/bin/bash

# This script loops through the extended 256 ANSI colors
for color in {0..255}; do
    printf "Color code: %3d \e[48;5;${color}m    \e[0m\n" $color
done

