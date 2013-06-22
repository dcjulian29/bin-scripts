@echo off

echo.
echo Determining User Profile Directory on this system...
echo.

set UP=%SYSTEMDRIVE%\Users

if exist "%UP%\julian" set UP=%UP%\julian
if exist "%UP%\jeasterling" set UP=%UP%\jeasterling

echo User Profile: %UP%
echo.
