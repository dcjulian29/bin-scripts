@ECHO OFF
SETLOCAL

IF [%COMPUTERNAME%] == [WINDEV] GOTO SYNC

echo.
echo This script is designed to only run on WINDEV...
echo.

goto EOF

:SYNC

set SRC=Z:\C
set DST=C:

call dir-sync %SRC%\dev\ %DST%\dev\
call dir-sync %SRC%\etc\ %DST%\etc\
call dir-sync %SRC%\bin\ %DST%\bin\

:EOF
