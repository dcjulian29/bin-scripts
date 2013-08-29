@echo off

setlocal

if exist "C:\Program Files (x86)\Java\jre6" goto JAVA6-X86
if exist "C:\Program Files (x86)\Java\jre7" goto JAVA7-X86
if exist "C:\Program Files\Java\jre6" goto JAVA6
if exist "C:\Program Files\Java\jre7" goto JAVA7

echo Could not find Java...
echo.

goto EOF

:JAVA6-X86
set JAVA_HOME=C:\Program Files (x86)\Java\jre6
set PATH="%JAVA_HOME%\bin";%PATH%
goto CONT

:JAVA7-X86
set JAVA_HOME=C:\Program Files (x86)\Java\jre7
set PATH="%JAVA_HOME%\bin";%PATH%
goto CONT

:JAVA6
set JAVA_HOME=C:\Program Files\Java\jre6
set PATH="%JAVA_HOME%\bin";%PATH%
goto CONT

:JAVA7
set JAVA_HOME=C:\Program Files\Java\jre7
set PATH="%JAVA_HOME%\bin";%PATH%
goto CONT

:CONT

javaw.exe %*

:EOF
