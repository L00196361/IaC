#!/bin/bash

# By: Alicia Garcia
# Date: 14NOV26
# Function: Check language for hello greeting
# Script: script9

echo "Press [Ctrl][C] to exit"

while read f
do
    case $f in
        Hello)
            echo English
            ;;
        "Dia Duit")
            echo Irish
            ;;
        Ciao)
            echo Italian
            ;;
        *)
            echo Unknown: $f
            ;;
    esac
done

exit 0
