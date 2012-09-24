<#  
.SYNOPSIS  
   Downloads new webcast as available    
.DESCRIPTION  
    Checks a list of RSS feeds provided in the OPML file and looks
    for new webcasts to download.    
.NOTES  
    File Name  : Get-Webcasts.ps1 
    Author     : Julian Easterling <julian@julianscorner.com> 
#>  

$global:workingDirectory = "D:\Videos\_download"
$global:dat = $workingDirectory + "\webcasts.dat"
$global:opmlFile = $workingDirectory + "\webcasts.opml"
$global:ignoreFile = $workingDirectory + "\webcasts.ignore"
$global:downloadFiles = $true

[Reflection.Assembly]::LoadWithPartialName("System.Web")

function Get-Hash
{
  param
  (
    [string]$Text,
    [ValidateSet("MD5", "SHA1", "SHA256", "SHA384", "SHA512")]
    [string]$Algorithm = "SHA1"
  )
  
  $a = [System.Security.Cryptography.HashAlgorithm]::Create($Algorithm)
   
  if (-not $a)
  {
    "Algorithm {0} not found" -f $algorithm
  }
  else
  {
    $encoding = New-Object System.Text.ASCIIEncoding
    $bytes = $encoding.GetBytes($Text)
    $hash = $a.ComputeHash($bytes)
    $hashstring = ""
    foreach ($byte in $hash) { $hashstring += $byte.ToString("x2") }
    
    $hashstring
  }
}

function Count-Object
{
  begin
  {
    $count = 0
  }
  process
  {
    $count += 1
  }
  end
  {
    $count
  }
}

function Get-RssEnclosures
{
  param
  (
    [Parameter(ValueFromPipeline=$True)][String]$rssUrl,
    [String]$destinationFolder = $pwd.Path
  )

  if (test-path $dat)
  {
    $enclosureHashes = Import-CSV $dat
  }
  else
  {
    $enclosureHashes = @()
  }
  
  if (test-path $ignoreFile)
  {
    $ignores = Import-CSV $ignoreFile
  }
  else
  {
    $ignores = @()
  }

  $client = New-Object Net.WebClient

  ""
  "Opening: $rssUrl"  
  $response = $client.DownloadString($rssUrl)
  $feed = [xml]$response.Substring($response.IndexOf('<'))
  $feedTitle = $feed.rss.channel.title
  
  "Feed Title: $feedTitle..."
  
  $feed.rss.channel.item | foreach `
  {
    ""
    $itemTitle = $_.title
    "Item: $itemTitle"

    $ignoreThis = $false
    $ignores | foreach `
    {
      if ($feedTitle -eq $_.feed)
      {
        if ($itemTitle -match $_.expression)
        {
          "  Ignoring this item..."
          $ignoreThis = $true
        }
      }    
    }
    
    if (-not $ignoreThis)
    {
      $enclosure = $_.enclosure
      
      if (([string]$enclosure.url).length -gt 0) 
      {
        # sometimes items have a non-parsable 'EDT' as part of pubdate 
        $pubdate = [DateTime]::Parse($_.pubdate.Replace("EDT", "-4"))
        $title = $_.title
        $prehash = ([string]([DateTime]$pubDate).ToFileTimeUtc()) + $title + $enclosure.url
        $hash = Get-Hash $prehash
        $enclosureUrl = new-object Uri($enclosure.url)
        $fileName = $enclosureUrl.Segments[-1]
        $filePath = (join-path $destinationFolder $filename)
        
        "Enclosure: $filename"
        if (($enclosureHashes | Where-Object { $_.hash -eq $hash } | Count-Object) -eq 0)
        {
          # Do not download a webcast if the file already exists.
          if ((-not (test-path ($filePath))))
          {
            if ($downloadFiles)
            {
              C:\bin\webcast-download $enclosure.url $destinationFolder
            }
          }
          
          if ((-not $downloadFiles) -or (test-path ([Web.HttpUtility]::UrlDecode($filePath))))
          {
            $ob = New-Object PSObject `
              | Add-Member -MemberType NoteProperty -Name "pubdate" -Value $pubdate -PassThru `
              | Add-Member -MemberType NoteProperty -Name "title" -Value $title -PassThru `
              | Add-Member -Membertype NoteProperty -Name "file" -Value $fileName -PassThru `
              | Add-Member -Membertype NoteProperty -Name "feed" -Value $feedTitle -PassThru `
              | Add-Member -MemberType NoteProperty -Name "hash" -Value $hash -PassThru
            $newHashes = @()
            if ($enclosureHashes.length -gt 0)
            {
              $newHashes += $enclosureHashes | select *
            }
            
            $newHashes += $ob | select *
            $newHashes | Export-CSV $dat -Force
            $enclosureHashes = $newHashes
          }        
        }
      }
    }
  } 
  ""
}

$opml = [xml](Get-Content $opmlFile)
$opml.opml.body.outline | foreach { Get-RssEnclosures $_.xmlUrl $workingDirectory }
