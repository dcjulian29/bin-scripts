@echo off

REG ADD "HKCU\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v HOME /d %%USERPROFILE%%
REG ADD "HKCU\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v TERM /d cygwin

