@echo off

setlocal

set CYG=%SYSTEMDRIVE%\cygwin

echo Generating User Account Entries...
%CYG%\bin\mkpasswd.exe -l -d > C:\etc\cygwin\passwd

echo Generating Group Entries...
%CYG%\bin\mkgroup.exe -l -d > C:\etc\cygwin\group

if exist "%CYG%\etc\group" del /f "%CYG%\etc\group"
if not exist "%CYG%\etc\group" mklink "%CYG%\etc\group" "%SYSTEMDRIVE%\etc\cygwin\group"

if exist "%CYG%\etc\passwd" del /f "%CYG%\etc\passwd"
if not exist "%CYG%\etc\passwd" mklink "%CYG%\etc\passwd" "%SYSTEMDRIVE%\etc\cygwin\passwd"

echo Done.
