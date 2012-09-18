@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

C:\cygwin\bin\dos2unix.exe %*
