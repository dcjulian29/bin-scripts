@echo off

SETLOCAL

SET PDIR="%ProgramFiles(x86)%\Notepad++\Notepad++.exe"

IF %PDIR% == "\Notepad++\Notepad++.exe" THEN GOTO B32

GOTO CONT

:B32

SET PDIR="%ProgramFiles%\Notepad++\Notepad++.exe"

:CONT

%PDIR% %*
