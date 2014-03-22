@echo off

setlocal

call %SYSTEMDRIVE%\tools\binaries\path-java.bat

javaw.exe %*

:EOF

endlocal
