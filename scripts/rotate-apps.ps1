$shell = New-Object -ComObject WScript.Shell
$ie = New-Object -ComObject Shell.Application
$delayInSeconds = 7

while ($true) `
{
  $running = Get-Process | Where {$_.MainWindowTitle}
  $documents = $ie.Windows.Invoke() | Select-Object Document
  $webpages = $documents.Document | Select-Object Title
  
  # Cycle through each Internet Explorer page to get the window activated
  foreach ($page in $webpages) `
  {
    $title = $page.title
    $b = $shell.AppActivate($title)
    if ($b) { break }
  }
  
  # Now IE should be activated.

  foreach ($page in $webpages) `
  {
    $k = $shell.SendKeys("^{TAB}")
    Start-Sleep -milliseconds 500
    $k = $shell.SendKeys("{F5}")
    Start-Sleep -s $delayInSeconds
  }

  # Cycle through remaining applications  
  
  foreach ($app in $running) `
  {
    $title = $app.MainWindowTitle
	
    $b = $shell.AppActivate($title)
    if (-not $b) `
    {
      $k = $shell.SendKeys("^%{F4}")
    }

    Start-Sleep -s $delayInSeconds
  }
}
