:: Batch file to demonstrate variables
:: By: Alicia Garcia
:: Initial file: 25Oct2026
:: Filename: Demo4.bat

@echo off
cls
title Alicia’s variable test
echo *******************************************
echo This batch file will do stuff
echo This is for demonstration purposes only.
echo *******************************************

echo *** About to do something critical ***
echo *** press [ctrl][c] to exit or any key to continue ***
pause 

setlocal

set "clonepath=V:\Clone of UB1604-Server\"
set "clonename=UB1604-04JAN18.vmx"
echo Path to Clone is %clonepath%%clonename%

set /A calculation=2+12/4
echo We got %calculation%

endlocal

exit/b