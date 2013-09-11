@echo off

setlocal

call %SYSTEMDRIVE%\bin\path-java.bat

java.exe %*

:EOF

endlocal
