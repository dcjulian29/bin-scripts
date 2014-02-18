@echo off

setlocal

set I=%1
set F=%2
set W=%3

shift
shift
shift

set PARAMS=%1

:LOOP
shift
if [%1]==[] goto AFTERLOOP
set PARAMS=%PARAMS% %1
goto LOOP

:AFTERLOOP

call %~dp0tshark.bat -i %I% -f %F% -w %W% -b filesize:100000 -b files:5 -N mt %PARAMS%