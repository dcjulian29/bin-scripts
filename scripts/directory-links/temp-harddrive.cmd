@echo off


if exist %SYSTEMDRIVE%\TEMP goto EOF

mkdir %SYSTEMDRIVE%\TEMP

:EOF
