@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

c:\cygwin\bin\gpg.exe --recipient "Julian Easterling" --output "%1.gpg" --encrypt "%1"

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
