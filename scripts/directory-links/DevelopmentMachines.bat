:: Make sure to run the Machine-Specific Directory Script First...
::-----------------------------------------------------------------

:: Git
mklink %UP%\.gitconfig %SYSTEMDRIVE%\etc\git\gitconfig
mklink %UP%\.gitignore %SYSTEMDRIVE%\etc\git\gitignore

:: KDiff3
mklink %UP%\.kdiff3rc %SYSTEMDRIVE%\etc\kdiff3\kdiff3rc
