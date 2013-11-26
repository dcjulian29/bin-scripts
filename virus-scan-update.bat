@echo off

setlocal

pushd %SYSTEMDRIVE%\Tools\PortableApps\ClamWinPortable\App\clamwin\bin

freshclam.exe --verbose

popd

endlocal
