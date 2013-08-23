@echo off

setlocal

pushd %SYSTEMDRIVE%\bin\File\ClamWin\App\clamwin\bin

freshclam.exe --verbose

popd

endlocal
