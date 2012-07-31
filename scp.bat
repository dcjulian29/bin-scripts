@echo off

c:\bin\development-tools\msysgit\bin\scp.exe %*

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
