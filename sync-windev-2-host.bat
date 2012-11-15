@ECHO OFF
SETLOCAL

IF [%COMPUTERNAME%] == [WINDEV] GOTO SYNC

echo.
echo This script is designed to only run on WINDEV...
echo.

goto EOF

:SYNC

set SRC=C:
set DST=Z:\C

call dir-sync %SRC%\dev\ %DST%\dev\

:EOF
