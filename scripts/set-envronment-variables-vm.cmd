:: Set my enviroment variables inside my VMs
::------------------------------------------------------------------------------
:: Make sure that the commands in this script are run in an elevated shell
:: Make sure that the Shared Folders are turned on and available to VM
GOTO EOF

setx HOME %USERPROFILE%

setx /m PATH %SYSTEMDRIVE%\bin;%PATH%

setx /m _NT_SOURCE_PATH SRV*C:\Temp
setx /m _NT_SYMBOL_PATH SRV*C:\Temp*http://msdl.microsoft.com/download/symbols
setx /m _NT_SYMCACHE_PATH C:\Temp
