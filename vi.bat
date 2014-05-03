@echo off

setlocal

if not exist C:\cygwin\bin\vim.exe goto NOVIM

if "%CYGWIN%" NEQ "" set CYGWIN=%CYGWIN% nodosfilewarning
if "%CYGWIN%" EQU "" set CYGWIN=nodosfilewarning

set TERM=msys
C:\cygwin\bin\vim.exe %*

goto EOF

:NOVIM

call %~dp0np.bat %*

:EOF

endlocal
