@echo off

setlocal

call %SYSTEMDRIVE%\bin\_isElevated.cmd YES "%0" %*
if %ERRORLEVEL% NEQ 99 goto EOF

if [%1] EQU [dev] goto DEV

setx HOME %USERPROFILE%
call %~dp0\set-path.bat

goto EOF

:DEV

:: On development systems
::set SYM=C:\symbols

::if not exist "%SYM%" mkdir "%SYM%"

::setx /m _NT_SOURCE_PATH SRV*%SYM%
::setx /m _NT_SYMBOL_PATH SRV*%SYM%*http://msdl.microsoft.com/download/symbols
::setx /m _NT_SYMCACHE_PATH %SYM%
::setx /m PATH "%SYSTEMDRIVE%\bin\development-tools;%PATH%"
setx /m TERM msys

:EOF
