#!/bin/bash

export LC_ALL=C.UTF-8

csv_file='Global YouTube Statistics.csv'
base_dir="United States"
mkdir -p "$base_dir"

categories=("Comedy" "Gaming" "Entertainment"  "Music")

for category in "${categories[@]}"; do
    awk -v category="$category" -F, '
    BEGIN { 
        getline      # skip first line
    }
    $8 == "United States" && $5 == category { 
        print >("'"${base_dir}/${category}.txt"'")
    }
    ' "$csv_file"
done
