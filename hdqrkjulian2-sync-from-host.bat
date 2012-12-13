@ECHO OFF
SETLOCAL

if [%COMPUTERNAME%] == [HDQRKJULIAN2] goto SYNC

echo.
echo This script is designed to only run on HDQRKJULIAN2...
echo.

goto EOF

:SYNC

set SRC=Z:
set DST=C:

if not "%~d0" == "%SRC%" "%SRC%\%~p0" 

if not exist %SRC% goto EOF

::call dir-sync %SRC%\dev\ %DST%\dev\
::call dir-sync %SRC%\etc\ %DST%\etc\
::call dir-sync %SRC%\bin\ %DST%\bin\
::call dir-sync %SRC%\Favorites %DST%\Users\jeast836\Favorites

:EOF
