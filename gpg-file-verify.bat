@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

c:\cygwin\bin\gpg.exe --verify "%1"

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
