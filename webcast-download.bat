@echo off

setlocal

if [%1] == [] goto PROVIDESRC

set SRC=%1

set DST=%USERPROFILE%\Downloads\webcasts\

if [%2] == [] goto STARTDOWNLOAD

set DST=%2

:STARTDOWNLOAD

if not exist %DST% mkdir %DST%

call %~dp0wget.bat "%SRC%" -P "%DST%" --continue --tries=10 --restrict-file-names=windows

goto EOF


:PROVIDESRC

echo.
echo Please provide the URL to download from...
echo.

:EOF
