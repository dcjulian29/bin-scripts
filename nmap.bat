@ECHO OFF

SETLOCAL

SET PATH="C:\bin\network\nmap;%PATH%"

nmap.exe -vv -n -Pn -sT -sV --unprivileged %*
