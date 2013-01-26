:: Set my enviroment variables
::------------------------------------------------------------------------------
GOTO EOF

setx HOME %USERPROFILE%


:: Need to be elevated...

setx /m PATH "%SYSTEMDRIVE%\bin;%PATH%"

:: On development systems

setx /m _NT_SOURCE_PATH SRV*C:\Temp
setx /m _NT_SYMBOL_PATH SRV*C:\Temp*http://msdl.microsoft.com/download/symbols
setx /m _NT_SYMCACHE_PATH C:\Temp