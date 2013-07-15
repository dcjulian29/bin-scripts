@echo off
setlocal

call sed -i 's/D:\\\/\\\\\\\\tower\\\\/g' //nas/public/playlists/*.m3u

start \\nas\public\playlists