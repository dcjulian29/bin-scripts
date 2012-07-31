@echo off

c:\bin\development-tools\msysgit\bin\ssh.exe %*

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
