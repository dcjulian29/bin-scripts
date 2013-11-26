@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

%SYSTEMDRIVE%\cygwin\bin\cat.exe %*

endlocal
