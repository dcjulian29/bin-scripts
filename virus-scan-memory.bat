@echo off

setlocal

set BASE=%SYSTEMDRIVE%\bin\File\ClamWin

set CLAMSCAN=%BASE%\App\clamwin\bin\clamscan.exe
set LOGFILE=%BASE%\Data\log\ClamScanLog.txt
set DATABASE=%BASE%\Data\db


call %SYSTEMDRIVE%\bin\_isElevated.cmd NO "%0" %*
if %ERRORLEVEL% EQU 99 goto ELEVATED

goto EOF

:ELEVATED

%CLAMSCAN% --database=%DATABASE% --log=%LOGFILE% --detect-pua --memory

:EOF

endlocal
