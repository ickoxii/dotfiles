#!/usr/bin/env bash

for file in $@; do
    base_name=$(echo "$file" | cut -d '.' -f1)
    pandoc -s -f markdown -t html5 -o "${base_name}.html" "$file" # -c "${base_name}.css"
done
