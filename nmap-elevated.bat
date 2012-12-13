@ECHO OFF

SETLOCAL

AT > NUL
IF %ERRORLEVEL% EQU 0 (
  SET PATH="C:\bin\network\nmap;%PATH%"

  nmap.exe -vv -n -Pn -sS -sV %*
) ELSE (
  ECHO You need elevated privilege to run this command. Exiting...
  EXIT /B 1
)
