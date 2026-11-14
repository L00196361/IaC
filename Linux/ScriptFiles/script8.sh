#!/bin/bash

# By: Alicia Garcia
# Date: 14NOV26
# Function: Demonstrate a while loop
# Script: script8

INPUT_STRING=hello

while [ "$INPUT_STRING" != "bye" ]
do
    echo "Please type something in (bye to quit)"
    read INPUT_STRING
    echo "You typed: $INPUT_STRING"
done

exit 0
