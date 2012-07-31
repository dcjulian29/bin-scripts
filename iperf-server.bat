@ECHO OFF

SETLOCAL

C:\bin\network\jperf\bin\iperf.exe -s -i 1 %*

popd