@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

C:\cygwin\bin\sha512sum.exe %*
