@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

C:\cygwin\bin\sha256sum.exe %*
