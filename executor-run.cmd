@echo off

setlocal

set EXSRC=%SYSTEMDRIVE%\Tools\apps\executor
set EXETC=%SYSTEMDRIVE%\etc\executor
set EXFEI=%USERPROFILE%\dropbox\executor-fei\executor.ini
set EXDST=%TEMP%\executor

if exist %EXDST% (
  echo Stopping the running Executor process...
  %EXDST%\executor.exe -exit
  call %SYSTEMDRIVE%\Tools\binaries\sleep.bat 5
  echo Removing existing temporary files...
  rmdir /s /q %EXDST% >nul
  if exist %EXDST% (
    echo A process has a lock on the directory, please remove it manually.
    pause
    :: One more try...
    rmdir /s /q %EXDST% >nul
  )
  if exist %EXDST% exit 1
)

mkdir %EXDST%

copy %EXSRC%\executor.exe %EXDST% >nul
if [%COMPUTERNAME%] == [JEASTERLINGPC] if exist %EXFEI% move %EXFEI% %EXETC%\executor.ini
copy %EXETC%\executor.ini %EXDST% >nul
copy %EXSRC%\defaulticon.ico %EXDST% >nul
copy %EXSRC%\hookwinr.dll %EXDST% >nul
copy %EXETC%\*.wav %EXDST% >nul

mkdir %EXDST%\skins
copy %EXSRC%\skins\*.* %EXDST%\skins >nul

pushd %EXDST%

:: "touch" all of the files so that they do not appear to be "older than 7 days" when the
:: dir-clean-temp script runs...

for /R "." %%G in (.) do (
  pushd %%G
  for /f "delims=|" %%F in ('dir /B /A:-D .') do (
    copy "%%F" +,, >nul
  )
  popd
)

echo Starting Executor
start Executor.exe -s

popd

endlocal
