:: Backup batch file to copy all files from Data folder to dated folder
:: inside the Backups folder and set permissions
:: By: Alicia Garcia
:: Initial file: 26Oct2026
:: Filename: Backup.bat

@echo off
setlocal

:: First extract date parts from system date
set DD=%DATE:~0,2%
set MM=%DATE:~3,2%
set YY=%DATE:~8,2%

:: Echo to console to validate 
echo Day , Month and Year variables are :
echo %DD% %MM% %YY%

:: Now map each month number to a string representation of the Month
if "%MM%"=="01" set MMM=JAN
if "%MM%"=="02" set MMM=FEB
if "%MM%"=="03" set MMM=MAR
if "%MM%"=="04" set MMM=APR
if "%MM%"=="05" set MMM=MAY
if "%MM%"=="06" set MMM=JUN
if "%MM%"=="07" set MMM=JUL
if "%MM%"=="08" set MMM=SEP
if "%MM%"=="09" set MMM=OCT
if "%MM%"=="10" set MMM=NOV
if "%MM%"=="11" set MMM=DEC

:: Echo to console to validate Month part
echo Month is
echo %MMM%

set BACKUPDATE=%DD%%MMM%%YY%
echo BackupDate is : = "%BACKUPDATE%"

set BACKUPDIR=Backups\%BACKUPDATE%

:: Create our Dated backup subfolder 
mkdir %BACKUPDIR%"

echo Copy all files from Data folder
copy "Data\*.*" "%BACKUPDIR%"

:: If an error occurs, inform user otherwise set read only
if errorlevel 1 (
    echo Backup Failed.
) else (
    attrib +R %BACKUPDIR%\*.*
    echo Files backed up successfully.
)
pause

