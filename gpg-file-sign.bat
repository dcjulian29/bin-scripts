@echo off
setlocal

call %~dp0gpg.bat --local-user "Julian Easterling" --detach-sign --armor "%1"

endlocal
