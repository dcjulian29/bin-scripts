@echo off
setlocal

call %~dp0gpg.bat --check-sigs %1

endlocal
