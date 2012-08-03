#	This script is used to purge files that are GUID folders

Function CleanUp ([string]$Folder)
{
	Get-ChildItem -Path $Folder `
    | where { $_.Name -match "^(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1})$" } `
    | Remove-Item  -Force
}


CleanUp -Folder "C:\Users\jeast836\AppData\Local"
