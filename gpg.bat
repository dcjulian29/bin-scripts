@echo off
setlocal


if exist "C:\Program Files\GNU\GnuPG" path C:\Program Files\GNU\GnuPG;%path%
if exist "C:\Program Files (x86)\GNU\GnuPG" path C:\Program Files (x86)\GNU\GnuPG;%path%

gpg2.exe --verbose %*

if %ERRORLEVEL% == 0 goto EOF

pause

:EOF
