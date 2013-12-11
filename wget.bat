@echo off

setlocal

set CYGWIN=%CYGWIN% nodosfilewarning

C:\cygwin\bin\wget.exe %*

endlocal
