#!/bin/bash

# By: Alicia Garcia
# Date: 14NOV26
# Function: Generate monthly user login/logout report
# Script: Users.sh

# Create the UserLogs folder if it does not already exist
mkdir -p UserLogs

# Find today's day and the last day of the current month
TODAY=$(date +%d)
LASTDAY=$(date -d "$(date +%Y-%m-01) +1 month -1 day" +%d)

# Validation to check if last day of month; commented out for testing
 if [ "$TODAY" != "$LASTDAY" ]
 then
     echo "This script only runs on the last day of the month."
     exit 1
 fi

# Build report filename using current month and year
MONTHYEAR=$(date +"%b%Y")
REPORT="UserLogs/${MONTHYEAR}.log"

# Check if report already exists
if [ -f "$REPORT" ]
then
    echo "Report already exists for this month: $REPORT"
    exit 1
fi

# Generate report
 if ! last > "$REPORT"
 then
    echo "ERROR: Failed to generate report."
    exit 1
 fi

# Verify file exists
if [ ! -f "$REPORT" ]
then
    echo "ERROR: Report file not found."
    exit 1
fi

# Apply permissions
if ! chmod 444 "$REPORT"
then
    echo "ERROR: Failed to set permissions."
    exit 1
fi

echo "Report created successfully:"
echo "$REPORT"

exit 0

