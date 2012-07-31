@echo off

%SystemDrive%\bin\network\wget\wget.exe %1 -P "D:\Videos\_download" --continue --tries=10 --restrict-file-names=windows
