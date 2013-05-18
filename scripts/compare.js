if (WScript.Arguments.Length == 1)
{
  var Shell = WScript.CreateObject("WScript.Shell");
  var TEMP = Shell.ExpandEnvironmentStrings("%TEMP%");
  var tempFile = TEMP + "\\winmerge-left.dat";
  var lockFile = TEMP + "\\compare.lock";
  
  var fso = new ActiveXObject("Scripting.FileSystemObject");
  var filename = WScript.Arguments(0);
  
  var lock;
  
  while (!(lock))
  {
    try
    {
      lock = fso.OpenTextFile(lockFile, 2, true);
    }
    catch(err) {}
  }
  
  if (fso.FileExists(tempFile))
  {
    var file = fso.OpenTextFile(tempFile, 1, false, 0);
    var left = file.ReadLine();
    var right = filename;
    
    file.Close();

    var app = new ActiveXObject("Shell.application")
    var SYSTEMDRIVE = Shell.ExpandEnvironmentStrings("%SYSTEMDRIVE%");
    var application = SYSTEMDRIVE + "\\bin\\File\\WinMerge\\WinMergePortable.exe";
  
    var arguments = "/u " + left + " " + right;  

    app.ShellExecute(application, arguments);
  
    fso.DeleteFile(tempFile, true);
  }
  else
  {
    var file = fso.OpenTextFile(tempFile, 2, true, 0)
    file.WriteLine(filename)
    file.Close();
  }
  
  lock.Close();
}
