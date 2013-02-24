@echo off

::------------------------------------------------------------------------------
call %SYSTEMDRIVE%\bin\scripts\directory-links\_SetUserProfileDirectory.bat
::------------------------------------------------------------------------------

set D=%SYSTEMDRIVE%\dev

if not exist %D%\ mkdir %D%

call :MAKELINK "%UP%\Documents\My Web Sites"
call :MAKELINK "%UP%\Documents\SQL Server Management Studio\Projects"
call :MAKELINK "%UP%\Documents\Visual Studio 2005\Projects"
call :MAKELINK "%UP%\Documents\Visual Studio 2008\Projects"
call :MAKELINK "%UP%\Documents\Visual Studio 2010\Projects"
call :MAKELINK "%UP%\Documents\Visual Studio 2012\Projects"

goto EOF

:MAKELINK

set SRC=%1
set SRC=%SRC:"=%

if not exist "%SRC%" goto EOF


:: Check to see if this a junction...
pushd %SRC%

SET DIRNAME=
FOR %%A in (%CD:\= %) DO SET DIRNAME=%%A

cd ..

for /f %%D in ('dir /adl /b .') do if [%%D]==[%DIRNAME%] rmdir %SRC%

popd

if not exist "%SRC%" goto DOLINK
robocopy "%SRC%\" "%D%\" /E /NP /NJH /NJS /NFL /NDL
rmdir /s /q "%SRC%"

:DOLINK

if not exist "%SRC%" mklink /D "%SRC%" "%D%"

:EOF
