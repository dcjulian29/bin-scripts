@echo off

echo.
echo Don't run this script directly...
echo.
echo 1. Log in with an alternative account (elevate?)
echo 2. Open the script in Notepad
echo 3. Run commands in an elevated shell as needed...
echo.
goto EOF


::------------------------------------------------------------------------------

setlocal
set UP=%SYSTEMDRIVE%\Users\Julian

::------------------------------------------------------------------------------
:: Temporary "Stuff" Directories
::------------------------------------------------------------------------------

SET T=%SYSTEMDRIVE%\Temp

rmdir /s /q  %T% >nul
:: Base Temporary Directory (point to RAM Drive if available)
mklink /D %T% E:\
:: If no RAM drive, set system temporary directory to %SYSTEMDRIVE%\Temp
mkdir %SYSTEMDRIVE%\Temp

::------------------------------------------------------------------------------

rmdir /s /q "%UP%\AppData\Local\Temp" >nul
mklink /D "%UP%\AppData\Local\Temp" %T%
rmdir /s /q "%SYSTEMROOT%\Temp" >nul
mklink /D "%SYSTEMROOT%\Temp" %T%

:: 32-Bit OS .Net Frameworks
rmdir /s /q "%SYSTEMROOT%\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files" 2>nul
mklink /D "%SYSTEMROOT%\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files" %T%
rmdir /s /q "%SYSTEMROOT%\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files" 2>nul
mklink /D "%SYSTEMROOT%\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files" %T%

:: 64-Bit OS .Net Frameworks
rmdir /s /q "%SYSTEMROOT%\Microsoft.NET\Framework64\v2.0.50727\Temporary ASP.NET Files" 2>nul
mklink /D "%SYSTEMROOT%\Microsoft.NET\Framework64\v2.0.50727\Temporary ASP.NET Files" %T%
rmdir /s /q "%SYSTEMROOT%\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files" 2>nul
mklink /D "%SYSTEMROOT%\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files" %T%

:: Browser Cache - IE
rmdir /s /q "%UP%\AppData\Local\Microsoft\Windows\Temporary Internet Files" 2>nul
mklink /D "%UP%\AppData\Local\Microsoft\Windows\Temporary Internet Files" %T%

:: Browser Cache - Chrome
rmdir /s /q "%UP%\AppData\Local\Google\Chrome\User Data\Temp" 2>nul
mklink /D "%UP%\AppData\Local\Google\Chrome\User Data\Temp" %T%

:: Browser Cache - Firefox
rmdir /s /q "%UP%\AppData\Local\Mozilla\Firefox\Profiles\vj6gmdj0.default\Cache" 2>nul
mklink /D "%UP%\AppData\Local\Mozilla\Firefox\Profiles\vj6gmdj0.default\Cache" %T%


