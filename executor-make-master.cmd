@echo off

if [%COMPUTERNAME%] == [TOWER] goto MAKEMASTER
if [%COMPUTERNAME%] == [LAPTOP] goto MAKEMASTER
if [%COMPUTERNAME%] == [JULIAN] goto MAKEMASTER

echo.
echo You can't run this command on this computer.

goto EOF

:MAKEMASTER

set EXECUTOR=%TEMP%\executor

set EXDIR=%SYSTEMDRIVE%\etc\executor
set BVER=%date:~-4,4%%date:~-10,2%%date:~-7,2%
set BVER=%BVER%_%time:~0,2%%time:~3,2%%time:~6,2%
set BVER=%BVER: =0%

echo Backing up original executor.ini file...
copy %EXDIR%\executor.ini %EXDIR%\backup\%BVER%.ini

echo.
echo Copying new master executor.ini file...
for /f "usebackq delims=" %%O in (`dir /b /ad %SYSTEMDRIVE%\home`) do (
    for /f "usebackq delims=" %%D in (`dir /b /ad %SYSTEMDRIVE%\home\%%O`) do (
        if [%%D] EQU [etc] (
            if exist "%SYSTEMDRIVE%\home\%%O\%%D\executor" (
                echo %EXECUTOR%\executor.ini --^> %SYSTEMDRIVE%\home\%%O\%%D\executor\executor.ini
                copy /V %EXECUTOR%\executor.ini %SYSTEMDRIVE%\home\%%O\%%D\executor\executor.ini
            )
        )
    )
)

echo %EXECUTOR%\executor.ini --^> %USERPROFILE%\dropbox\executor-fei\executor.ini
copy /V /Y %EXECUTOR%\executor.ini %USERPROFILE%\dropbox\executor-fei\executor.ini

echo %EXECUTOR%\executor.ini --^> %USERPROFILE%\dropbox\executor-dev\executor.ini
copy /V /Y %EXECUTOR%\executor.ini %USERPROFILE%\dropbox\executor-dev\executor.ini

:EOF

echo.
pause
