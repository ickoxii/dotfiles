#!/usr/bin/env bash

# Check if two integer parameters are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <chapter_number> <number_of_sections>"
    exit 1
fi

chapter_number=$1
number_of_sections=$2

# Create README.md
echo "# $chapter_number" > README.md
echo "" >> README.md
echo "## Table of Contents" >> README.md
echo "" >> README.md

# Create chapter section markdown files
for ((i = 1; i <= number_of_sections; i++)); do
    section_file="$chapter_number-$i.md"
    echo "$i. [$chapter_number.$i](./$section_file)" >> README.md

    echo "# $chapter_number.$i" > "$section_file"
    echo "" >> "$section_file"
    echo "## Definitions" >> "$section_file"
    echo "" >> "$section_file"
    if [ "$i" -eq "$number_of_sections" ]; then
        echo "[toc](./README.md) [next]()" >> "$section_file"
    else
        echo "[toc](./README.md) [next](./$chapter_number-$((i+1)).md)" >> "$section_file"
    fi
done

# Add summary and link to next chapter section in README.md
echo "" >> README.md
echo "## Summary" >> README.md
echo "" >> README.md
echo "[next](./$chapter_number-1.md)" >> README.md
