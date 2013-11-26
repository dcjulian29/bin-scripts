@echo off

setlocal

set BASE=%SYSTEMDRIVE%\Tools\PortableApps\ClamWinPortable

set CLAMSCAN=%BASE%\App\clamwin\bin\clamscan.exe
set LOGFILE=%BASE%\Data\log\ClamScanLog.txt
set DATABASE=%BASE%\Data\db


%CLAMSCAN% --database=%DATABASE% --log=%LOGFILE% "%1"

endlocal
