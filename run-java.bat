@echo off

setlocal

call %SYSTEMDRIVE%\tools\binaries\path-java.bat

java.exe %*

:EOF

endlocal
