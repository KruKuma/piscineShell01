#!/bin/bash

export FT_LINE1=3
export FT_LINE2=8    

cat /etc/passwd | \
    	grep -v '\#' | \
    	awk "NR % 2 == 1"| \
	sed '1!n;d' | \
	cut -d':' -f1 | \
    	rev | \
    	sort -r | \
    	awk 'NR>= ENVIRON["FT_LINE1"] && NR<= ENVIRON["FT_LINE2"]' | \
    	paste -s -d"," - | \
    	sed 's/,/, /g' | \
    	sed 's/$/./' | \
    	tr -d '\n'
