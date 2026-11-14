#!/bin/bash

# By: Alicia Garcia
# Date: 14NOV26
# Function: Create text files using seq
# Script: script11

for indexnumber in `seq 10`
do
    touch TextFile$indexnumber.txt
done

exit 0
