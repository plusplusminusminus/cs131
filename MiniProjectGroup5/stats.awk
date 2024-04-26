#!/usr/bin/awk -f

BEGIN {
    FS=",";  # Set field separator as comma for CSV
    OFS=", ";  # Output field separator
    print "Column, Min, Max";
}

NR == 1 {
    for (i = 1; i <= NF; i++) {
        header[i] = $i;  # Store header names
    }
    next;  # Skip the header row
}

{
    for (i = 1; i <= NF; i++) {
        value = ($i == "" ? "NA" : $i);  # Handle empty cells
        if (NR == 2 || value < min[i]) {
            min[i] = value;
        }
        if (NR == 2 || value > max[i]) {
            max[i] = value;
        }
    }
}

END {
    for (i = 3; i <= NF; i++) {
        print header[i], min[i], max[i];
    }
}
