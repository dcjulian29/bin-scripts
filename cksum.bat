@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

%SYSTEMDRIVE%\cygwin\bin\cksum.exe %*

endlocal
