#!/usr/bin/bash

awk -F',' '
    NR > 1 { # Skip the header row
        if(!seen[$1]++) { 
		print "Country,Year,HIV/AIDS" > ("subset_" $1 ".csv");
       	} 
        printf "%s,%s,%s\n", $1, $3, $12 >> ("subset_" $1 ".csv"); 
    }
' cause_of_deaths.csv

