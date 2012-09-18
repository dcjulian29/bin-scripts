@echo off
setlocal
SET CYGWIN=%CYGWIN% nodosfilewarning

C:\cygwin\bin\unix2dos.exe %*
