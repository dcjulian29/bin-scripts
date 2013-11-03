echo.
echo Determining User Profile Directory on this system...
echo.

set UP=%SYSTEMDRIVE%\Users

if exist "%UP%\julian" set UP=%UP%\julian
if exist "%UP%\julian.easterling" set UP=%UP%\julian.easterling

echo User Profile: %UP%
echo.
