@echo off

pushd "%PF32%\SpiderOak"

SpiderOak.exe --shutdown
SpiderOak.exe -v --batchmode --purge-historical-versions all

echo.
pause

popd
