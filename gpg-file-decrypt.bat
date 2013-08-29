@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

c:\cygwin\bin\gpg.exe --decrypt-files "%1"

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
