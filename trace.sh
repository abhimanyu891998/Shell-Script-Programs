#!/bin/bash
if [ $# -ne 1 ]
then
echo "Usage: ./trace.sh (patientID)"
fi
a="`ls | grep -E "*.log"`"
if [ -e $1.log ]
then
exit 1
else
if [ $# -eq 1 ]
then
for file in $a
do
d="`grep -E ".*,.*,$1,.*" $file >> "$1.log"`"
done
sort -k 1,2 "$1.log" >> "output.log"
rm "$1.log"
mv "output.log" "$1.log"
e="`wc "$1.log" | cut -d' ' -f1`"
if [ "$e" == 0 ]
then
rm "$1.log"
echo "No records found for $1"
fi
fi
fi
