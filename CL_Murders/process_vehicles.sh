#!/bin/bash

# When the line contains "License Plate"
awk '/License Plate/ 
{
    if (NR > 1) print "\n";
    printf "%s", $0;
    next;
}

# For all other lines
{
    printf ",%s", $0;
}

# After processing all records, print a final newline
END 
{
    print "\n";
}' vehicles > processed_vehicles.txt
