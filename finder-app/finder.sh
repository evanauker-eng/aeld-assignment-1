#!/bin/sh
# Author: Evan Auker

filesdir="$1"
searchstr="$2"

# Check if num of args is less than 2
if [ $# -lt 2 ]; then
    # Print error message and exit
    echo "Error: missing arguments."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Check if filesdir is NOT a directory
if [ ! -d "$filesdir" ]; then
    # Print error message and exit
    echo "Error: '$filesdir' is not a directory on the filesystem."
    exit 1
fi

# Check in list of files under filesdir and count the number of files
num_files=$(find "$filesdir" -type f | wc -l)

# Search in directory for the search string and count the number of matching lines
num_matches=$(grep -rF -e "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $num_files and the number of matching lines are $num_matches"
exit 0