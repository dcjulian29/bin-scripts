; Monitor the clipboard then download webcast

#Persistent
return

OnClipboardChange:

  If RegExMatch(Clipboard, "^(https?://|www\.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$")
  {
    url = %ClipBoard%
    Run, %comspec% /c C:\bin\webcast-download.bat "%url%" && pause
  }
  return
