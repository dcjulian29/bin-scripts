@echo off

if exist "%ProgramFiles%\nodejs" path %PATH%;%ProgramFiles%\nodejs
if exist "%ProgramW6432%\nodejs" path %PATH%;%ProgramW6432%\nodejs
if exist %APPDATA%\npm path %PATH%;%APPDATA%\npm
