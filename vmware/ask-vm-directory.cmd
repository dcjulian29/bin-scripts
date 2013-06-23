IF "%1" == "" GOTO ERROR
IF "%2" == "" GOTO ERROR
IF "%3" == "" GOTO PROVIDEVMNAME

SET VMNAME=%3
GOTO CONTINUE

:PROVIDEVMNAME

SET VMNAME=virtual

SET /p NP="What is the name of the virtual machine directory [%VMNAME%]? "
IF "" neq "%NP%" SET VMNAME=%NP% 

:CONTINUE

:: Trim input
SET VMNAME=%VMNAME: =%

SET VM=%VMDIR%\%VMNAME%
SET SNAP=%VMDIR%\%VMNAME%-SNAPSHOT

:: Should VM directory exist?
IF [%1] == [YES] GOTO YESVM
IF [%1] == [NO] GOTO NOVM
GOTO ERROR

:YESVM

IF EXIST "%VM%" GOTO CHECKVMX

echo.
echo This virtual machine directory does not exist.
echo.

exit /B 1

:NOVM

IF NOT EXIST "%VM%" GOTO CHECKSNAP

echo.
echo This virtual machine directory already exists.
echo.

exit /B 2

:CHECKVMX

dir %VM%\*.vmx >nul
if %ERRORLEVEL% == 0 GOTO CHECKSNAP

echo.
echo The directory specified does not contain a virtual machine...
echo.

GOTO EOF

:CHECKSNAP

:: Should VM snapshot directory exist?
if [%2] == [NA] GOTO EOF
IF [%2] == [YES] GOTO YESSNAP
IF [%2] == [NO] GOTO NOSNAP
GOTO ERROR

:YESSNAP

IF EXIST "%SNAP%" GOTO EOF

echo.
echo This virtual machine snapshot does not exist.
echo.

exit /B 3

:NOSNAP

IF NOT EXIST "%SNAP%" GOTO EOF

echo.
echo This virtual machine already has a snapshot, please delete the copy and try again.
echo.

exit /B 4

:ERROR

echo.
echo This script was called with missing parameters...
echo.

exit /B 5

:EOF
