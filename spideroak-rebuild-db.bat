@echo off

pushd "%PF32%\SpiderOak"

SpiderOak.exe --shutdown
SpiderOak.exe -v --batchmode --vacuum --rebuild-reference-database

echo.
pause

popd
