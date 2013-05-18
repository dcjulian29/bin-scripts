@echo off
setlocal

call sed -i 's/D:\\\/\\\\\\\\tower\\\\/g' //nas/shares/public/playlists/*.m3u

start \\nas\shares\public\playlists