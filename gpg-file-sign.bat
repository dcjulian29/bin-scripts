@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

c:\cygwin\bin\gpg.exe --local-user "Julian Easterling" --clearsign "%1"

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
