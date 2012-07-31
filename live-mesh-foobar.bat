@echo off

FOR /F "tokens=*" %%G IN ('DIR /B /S *(JULIAN^)* *(HDQRK*^)* *(OFFICE^)*') DO (
  echo --%%G
  IF [%1] == [delete] rm -rf "%%G"
)


:EOF
