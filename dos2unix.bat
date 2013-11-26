@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

%SYSTEMDRIVE%\cygwin\bin\dos2unix.exe %*
