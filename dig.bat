@ECHO OFF

SETLOCAL

SET PATH=C:\bin\network\dig;%PATH%

dig.exe %*
