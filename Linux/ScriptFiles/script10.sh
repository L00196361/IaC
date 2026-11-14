#!/bin/bash

# By: Alicia Garcia
# Date: 14NOV26
# Function: Simple number check
# Script: script10

echo "Enter a number:"
read X

if [ "$X" -lt "0" ]
then
    echo "X is less than zero"
    exit 0
else
    echo "X is greater than or equal to zero"
    exit 0
fi
