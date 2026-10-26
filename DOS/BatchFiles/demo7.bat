:: Batch file to demonstrate conditional branching 
:: By: Alicia Garcia
:: Initial file: 26Oct2026
:: Filename: Demo7.bat

@echo off
cls
title Alicia’s Find a File
echo *******************************************
echo This batch file will do stuff
echo This is for demonstration purposes only.
echo *******************************************

set ospath=C:\Windows\
set filename=explorer.exe

If exist %ospath%%filename% echo %filename% exists