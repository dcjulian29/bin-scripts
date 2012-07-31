######################################################################
#	V1.0 File Cleanup
#	The script is used to purge files that are older than "age" days

Function CleanUp ([string]$Folder, [string]$Filter, [int]$Age)
{
	Get-ChildItem -Path $Folder -Filter $Filter -Recurse `
    | where {  [Datetime]::Now -gt $_.LastWriteTime.AddDays($AgeDays) } `
    | Remove-Item  -Force -Recurse
}

#	Examples:
#		Directory				                    FileFilter		Age
#		c:\Exchsrvr\MailRoot\vsi 1\BadMail\	*.b*	    		7
#		c:\antigen\archive\out			        *.eml 		  	14
#		C:\winnt\system32\logfiles\w3svc1\	*.log			    30

CleanUp -Folder "C:\TEMP" -Filter "*.*" -Age 7

		