@echo off

setlocal

if [%1] == [] goto PROVIDESRC

set SRC=%1

set DST=D:\Videos\_download

if [%2] == [] goto STARTDOWNLOAD

set DST=%2

:STARTDOWNLOAD

%SystemDrive%\bin\network\wget\wget.exe "%SRC%" -P "%dst%" --continue --tries=10 --restrict-file-names=windows

goto EOF


:PROVIDESRC

echo.
echo Please provide the URL to download from...
echo.

:EOF
