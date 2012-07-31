@ECHO OFF

SETLOCAL

C:\bin\network\jperf\bin\iperf.exe -c %* -i 1

popd