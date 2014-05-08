@echo off

setlocal

set EXSRC=%SYSTEMDRIVE%\Tools\apps\executor
set EXETC=%SYSTEMDRIVE%\etc\executor
set EXDRP=%USERPROFILE%\dropbox\executor
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

if [%COMPUTERNAME%] == [JEASTERLINGPC2] (
    copy /Y %EXDRP%\executor.ini %EXDST% >nul
    copy /Y %EXDRP%\*.wav %EXDST% >nul
)

if [%COMPUTERNAME%] == [TOWERDEV] (
    copy /Y %EXDRP%\executor.ini %EXDST% >nul
    copy /Y %EXDRP%\*.wav %EXDST% >nul
)

if [%COMPUTERNAME%] == [LAPTOPDEV] (
    copy /Y %EXDRP%\executor.ini %EXDST% >nul
    copy /Y %EXDRP%\*.wav %EXDST% >nul
)

if exist %EXETC%\executor.ini (
    copy /Y %EXETC%\executor.ini %EXDST% >nul
    copy /Y %EXETC%\*.wav %EXDST% >nul
)

copy %EXSRC%\executor.exe %EXDST% >nul
copy %EXSRC%\defaulticon.ico %EXDST% >nul
copy %EXSRC%\hookwinr.dll %EXDST% >nul

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
