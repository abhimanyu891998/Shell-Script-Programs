#!/bin/bash
a="`ls| grep -E "*.log"`"

for file in $a
do
echo "$file :"
b="`cut -d',' -f4 $file | sort | uniq -c | sort -rn | head -n 3`"
echo "$b"
done
