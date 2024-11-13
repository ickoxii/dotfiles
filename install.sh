#!/usr/bin/env bash

for dir in * .* ; do
    if [ -f $dir/link.sh ]; then
        echo "Running $dir/link.sh";
        bash "$dir/link.sh";
    fi
done
