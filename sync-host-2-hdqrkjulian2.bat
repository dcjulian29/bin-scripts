@ECHO OFF
SETLOCAL

IF [%COMPUTERNAME%] == [HDQRKJULIAN2] GOTO SYNC

echo.
echo This script is designed to only run on HDQRKJULIAN2...
echo.

goto EOF

:SYNC

set SRC=Z:
set DST=C:

call dir-sync %SRC%\dev\ %DST%\dev\
call dir-sync %SRC%\etc\ %DST%\etc\
call dir-sync %SRC%\bin\ %DST%\bin\
call dir-sync %SRC%\Favorites\ %DST%\Users\jeast836\Favorites

:EOF
