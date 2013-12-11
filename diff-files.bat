@echo off
setlocal

set CYGWIN=%CYGWIN% nodosfilewarning
set PATH=%SYSTEMDRIVE%\cygwin\bin;%PATH%

%SYSTEMDRIVE%\cygwin\bin\diff.exe %*

endlocal
