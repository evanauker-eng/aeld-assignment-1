#!/bin/sh
# Author: Evan Auker

writefile="$1"
writestr="$2"

# Check if num of args is less than 2
if [ $# -lt 2 ]; then
    echo "Error: missing arguments."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")" || {
    echo "Error: could not create directory for '$writefile'."
    exit 1
}

# Write the string, overwriting any existing file
echo "$writestr" > "$writefile" || {
    echo "Error: could not create file '$writefile'."
    exit 1
}