function Get-RssEnclosures(
  [Parameter(ValueFromPipeline=$True)][String]$rssUrl,
  [String]$destinationFolder = $pwd.Path)
{
  $client = New-Object Net.WebClient
  
  $feed = [xml]$client.DownloadString($rssUrl)
  
  $feed.rss.channel.item | foreach `
  {
    $enclosureUrl = $_.enclosure.url    
    
    if ($enclosureUrl -ne "") {
      $enclosureUrl = new-object Uri($enclosureUrl)
      $filename = (join-path $destinationFolder $enclosureUrl.Segments[-1])
      
      if ((-not (test-path ($fileName))))
      {
        $enclosureUrl.AbsoluteUri
        try
        {
          $client.DownloadFile($enclosureUrl.AbsoluteUri, $filename)
        }
        catch [Exception]
        {
          $_.Exception.Message
        }
      }
    }
  } 
}

@("http://themeserver.microsoft.com/default.aspx?p=Bing&c=Desktop&m=en-US",
  "http://themeserver.microsoft.com/default.aspx?p=Windows&c=Aqua&m=en-US",
  "http://themeserver.microsoft.com/default.aspx?p=Windows&c=Fauna&m=en-US",
  "http://themeserver.microsoft.com/default.aspx?p=Windows&c=Flora&m=en-US",
  "http://themeserver.microsoft.com/default.aspx?p=Windows&c=Insects&m=en-US",
  "http://themeserver.microsoft.com/default.aspx?p=Windows&c=LandScapes&m=en-US") | foreach `
  {
    Get-RssEnclosures $_ C:\Users\jeast836\Wallpapers\
  }









