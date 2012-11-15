@ECHO OFF
SETLOCAL

IF [%COMPUTERNAME%] == [HDQRKJULIAN2] GOTO SYNC

echo.
echo This script is designed to only run on HDQRKJULIAN2...
echo.

goto EOF

:SYNC

set SRC=C:
set DST=Z:

call mirror-folder %SRC%\dev\ %DST%\dev\

if [%1] == [ALL] goto ALL
if [%1] == [all] goto ALL

goto EOF

:ALL

call dir-sync %SRC%\etc\ %DST%\etc\
call dir-sync %SRC%\bin\ %DST%\bin\

:EOF
