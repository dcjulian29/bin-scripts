$file = "codemash2013-session-list.csv"
$client = New-Object Net.WebClient
$sessions = [xml]$client.DownloadString("http://rest.codemash.org/api/sessions")

$sessions.Sessions.Session | foreach `
{
  $title = $_.Title

  $start = [DateTime]::Parse($_.Start)
  $startDate = $start.ToShortDateString()
  $startTime = $start.ToShortTimeString()

  try
  {
    $end = [DateTime]::Parse($_.End)
  }
  catch
  {
    $end = $start.AddMinutes(60)
  }

  $endDate = $end.ToShortDateString()
  $endTime = $end.ToShortTimeString()

  $remindDate = $startDate
  $remindTime = $start.AddMinutes(-30).ToShortTimeString()
  
  $description = "`tSpeaker:`t" + $_.SpeakerName + "`n`tTechnology:`t" + $_.Technology + "`n`tDifficulty:`t" + $_.Difficulty + "`n`n" + $_.Abstract
  
  $technology = $_.Technology
  
  $location = $_.Room
  
  $ob = New-Object PSObject `
    | Add-Member -MemberType NoteProperty -Name "Subject" -Value $title -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Start Date" -Value $startDate -PassThru `
    | Add-Member -Membertype NoteProperty -Name "Start Time" -Value $startTime -PassThru `
    | Add-Member -Membertype NoteProperty -Name "End Date" -Value $endDate -PassThru `
    | Add-Member -MemberType NoteProperty -Name "End Time" -Value $endTime -PassThru `
    | Add-Member -MemberType NoteProperty -Name "All day event" -Value "False" -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Reminder on/off" -Value "True" -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Reminder Date" -Value $remindDate -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Reminder Time" -Value $remindTime -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Description" -Value $description -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Location" -Value $location -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Priority" -Value "Normal" -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Private" -Value "False" -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Sensitivity" -Value "Normal" -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Show time as" -Value "2" -PassThru `
    | Add-Member -MemberType NoteProperty -Name "Technology" -Value $technology -PassThru

  $sessionDetails = @()
  if ($sessionList.length -gt 0)
  {
    $sessionDetails += $sessionList | select *
  }
  
  $sessionDetails += $ob | select *
  "... $title ..."
  $sessionDetails | Export-CSV $file -Force
  $sessionList = $sessionDetails
}

Get-Content $file |
    select -Skip 1 |
    Set-Content "$file-temp"
move "$file-temp" $file -Force
