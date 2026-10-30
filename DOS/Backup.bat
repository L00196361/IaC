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

:: Build up backup date
set BACKUPDATE=%DD%%MMM%%YY%
echo BackupDate is : = "%BACKUPDATE%"

:: Define backup location
set BACKUPDIR=Backups\%BACKUPDATE%

:: Check if we have already run and backup folder already exists and inform user and exit
if exist "%BACKUPDIR%" (
    echo Backup folder already exists.
    pause
    exit /b 1
)

:: Add logging - create log file in same folder as backed-up files
set LOGFILE=Backups\Backup_%BACKUPDATE%.log

:: Start log file
echo ======================================= > "%LOGFILE%"
echo Backup Script Started >> "%LOGFILE%"
echo Date: %DATE% %TIME% >> "%LOGFILE%"
echo ======================================= >> "%LOGFILE%"
echo Day, Month and Year variables are: >> "%LOGFILE%"
echo %DD% %MM% %YY% >> "%LOGFILE%"
echo Month is: >> "%LOGFILE%"
echo %MMM% >> "%LOGFILE%"
echo BackupDate is: %BACKUPDATE% >> "%LOGFILE%"

:: Create backup directory
echo Creating backup directory %BACKUPDIR%
echo Creating backup directory %BACKUPDIR% >> "%LOGFILE%"
mkdir "%BACKUPDIR%" >> "%LOGFILE%" 2>&1

:: Copy files
echo Copy all files from Data folder
copy "Data\*.*" "%BACKUPDIR%" >> "%LOGFILE%" 2>&1

:: If an error occurs, inform user otherwise set read only
if errorlevel 1 (
    echo Backup Failed.
    echo ERROR: Backup Failed. >> "%LOGFILE%"
) else (
     attrib +R %BACKUPDIR%\*.* >> "%LOGFILE%" 2>&1
    echo Files backed up successfully.
    echo Files backed up successfully. >> "%LOGFILE%"
    echo Readonly attributes applied. >> "%LOGFILE%"
)
echo Backup script completed at %TIME% >> "%LOGFILE%"
echo ======================================= >> "%LOGFILE%"
pause


