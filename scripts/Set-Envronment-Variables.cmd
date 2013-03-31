@echo off

if [%1] NEQ [dev] goto DEV

setx HOME %USERPROFILE%
setx /m PATH "%SYSTEMDRIVE%\bin;%PATH%"

goto EOF

:DEV

:: On development systems
mkdir C:\symbols
setx /m _NT_SOURCE_PATH SRV*C:\symbols
setx /m _NT_SYMBOL_PATH SRV*C:\symbols*http://msdl.microsoft.com/download/symbols
setx /m _NT_SYMCACHE_PATH C:\symbols
setx /m PATH "%SYSTEMDRIVE%\bin\development-tools;%PATH%"

:EOF
