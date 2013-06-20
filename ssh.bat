@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning
SET TERM=

c:\cygwin\bin\ssh.exe %*

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
