:: Make my directory links inside my VMs
::------------------------------------------------------------------------------
:: Make sure that the commands in this script are run in an elevated shell
:: Make sure that the Shared Folders are turned on and available to VM
GOTO EOF

setlocal
set UP=%SYSTEMDRIVE%\Users\jeast836

:: VM Drive
mklink /D %SYSTEMDRIVE%\bin Z:\bin
mklink /D %SYSTEMDRIVE%\cygwin Z:\cygwin
mklink /D %SYSTEMDRIVE%\dev Z:\dev
mklink /D %SYSTEMDRIVE%\etc Z:\etc

:: PowerShell
rmdir /s /q %UP%\Documents\WindowsPowerShell 
mklink /J %UP%\Documents\WindowsPowerShell %SYSTEMDRIVE%\bin\WindowsPowerShell

:: SSH
mklink /J %UP%\.ssh %SYSTEMDRIVE%\etc\ssh

:: GIT
mklink %UP%\.gitconfig %SYSTEMDRIVE%\etc\git\gitconfig
mklink %UP%\.gitattributes %SYSTEMDRIVE%\etc\git\gitattributes
mklink %UP%\.gitignore %SYSTEMDRIVE%\etc\git\gitignore
mklink %UP%\.gitk %SYSTEMDRIVE%\etc\git\gitk

:: SVN
mklink /J %UP%\.subversion %SYSTEMDRIVE%\etc\subversion
mklink /J %UP%\AppData\Roaming\Subversion %SYSTEMDRIVE%\etc\subversion

:: Mecurial
mklink %UP%\.hgrc %SYSTEMDRIVE%\etc\mecurial\hgrc

:: Cygwin
mklink %UP%\.bash_profile %SYSTEMDRIVE%\etc\cygwin\bash_profile
mklink %UP%\.bashrc %SYSTEMDRIVE%\etc\cygwin\bashrc
mklink %UP%\.inputrc %SYSTEMDRIVE%\etc\cygwin\inputrc
mklink %UP%\.minttyrc %SYSTEMDRIVE%\etc\cygwin\minttyrc
mklink %UP%\.Xresources %SYSTEMDRIVE%\etc\cygwin\Xresources

SET T=C:\Temp

:: Temporary File directories
rmdir /s /q "%UP%\AppData\Local\Temp"
mklink /D "%UP%\AppData\Local\Temp" %T%
rmdir /s /q "%SYSTEMROOT%\Temp"
mklink /D "%SYSTEMROOT%\Temp" %T%

:: 32-Bit OS .Net Frameworks
rmdir /s /q "%SYSTEMROOT%\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files"
mklink /D "%SYSTEMROOT%\Microsoft.NET\Framework\v2.0.50727\Temporary ASP.NET Files" %T%
rmdir /s /q "%SYSTEMROOT%\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files"
mklink /D "%SYSTEMROOT%\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files" %T%

:: 64-Bit OS .Net Frameworks
rmdir /s /q "%SYSTEMROOT%\Microsoft.NET\Framework64\v2.0.50727\Temporary ASP.NET Files"
mklink /D "%SYSTEMROOT%\Microsoft.NET\Framework64\v2.0.50727\Temporary ASP.NET Files" %T%
rmdir /s /q "%SYSTEMROOT%\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files"
mklink /D "%SYSTEMROOT%\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files" %T%

:: Browser Cache - IE
rmdir /s /q "%UP%\AppData\Local\Microsoft\Windows\Temporary Internet Files"
mklink /D "%UP%\AppData\Local\Microsoft\Windows\Temporary Internet Files" %T%

:: Browser Cache - Chrome
rmdir /s /q "%UP%\AppData\Local\Google\Chrome\User Data\Temp" 2
mklink /D "%UP%\AppData\Local\Google\Chrome\User Data\Temp" %T%

:: Browser Cache - Firefox
rmdir /s /q "%UP%\AppData\Local\Mozilla\Firefox\Profiles\vj6gmdj0.default\Cache" 2
mklink /D "%UP%\AppData\Local\Mozilla\Firefox\Profiles\vj6gmdj0.default\Cache" %T%

:: CodeRush Solution Cache
rmdir /s /q "%UP%\AppData\Roaming\CodeRush for VS .NET\1.1\SolutionCache" 
mklink /D "%UP%\AppData\Roaming\CodeRush for VS .NET\1.1\SolutionCache" %SYSTEMDRIVE%\Temp

:: --------------------------------------------------------------------------
:: Document Folder Links
:: --------------------------------------------------------------------------

:: SQL Server Management Studio
rmdir /s /q "%UP%\Documents\SQL Server Management Studio\Projects" 
mklink /J "%UP%\Documents\SQL Server Management Studio\Projects" C:\dev

:: Visual Studio
rmdir /s /q "%UP%\Documents\Visual Studio 2012\Projects" 
mklink /J "%UP%\Documents\Visual Studio 2012\Projects" C:\dev
::rmdir /s /q "%UP%\Documents\Visual Studio 2010\Projects" 
::mklink /J "%UP%\Documents\Visual Studio 2010\Projects" C:\dev
::rmdir /s /q "%UP%\Documents\Visual Studio 2008\Projects" 
::mklink /J "%UP%\Documents\Visual Studio 2008\Projects" C:\dev
::rmdir /s /q "%UP%\Documents\Visual Studio 2005\Projects" 
::mklink /J "%UP%\Documents\Visual Studio 2005\Projects" C:\dev

mklink /D "%UP%\Documents\My Web Sites" C:\dev
