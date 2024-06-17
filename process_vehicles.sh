#!/bin/bash

# When the line contains "License Plate"
awk '/License Plate/ {
    if (NR > 1) print "\n";
    printf "%s", $0;
    next;
}

# For all other lines
{
    printf ",%s", $0;
}

# After processing all records, print a final newline
END {
    print "\n";
}' vehicles > processed_vehicles.txt

# Filter the processed data with grep in the command line.
grep 'License Plate.*L337.*9' processed_vehicles.txt | grep 'Color: Blue' | grep 'Make: Honda'
