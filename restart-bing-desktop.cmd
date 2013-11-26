@echo off

setlocal

set BD=C:\Program Files (x86)\Microsoft\BingDesktop

echo Stopping the running Bing Desktop process...
"%BD%\BingDesktopRestarter.exe"

echo Starting Bing Desktop...
start "" "%BD%\BingDesktop.exe"

endlocal
