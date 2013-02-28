@echo off

pushd "%PF32%\SpiderOak"

SpiderOak.exe --shutdown
SpiderOak.exe -v --batchmode --destroy-shelved-x
SpiderOak.exe -v --batchmode --repair

echo.

popd
