@echo off

setlocal

call %SYSTEMDRIVE%\bin\path-java.bat

javaw.exe %*

:EOF

endlocal
