@echo off
setlocal

path %~dp0gpg;%path%

gpg2.exe --verbose %*

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
