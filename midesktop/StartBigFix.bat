@setlocal enableextensions & C:\Python\python.exe -x %~f0 %* & goto :EOF

import time
import win32service
import win32serviceutil

RUNNING = win32service.SERVICE_RUNNING
STOPPED = win32service.SERVICE_STOPPED

def Status(name, machine=None):
  return win32serviceutil.QueryServiceStatus(name, machine)[1]

def Start(name, machine=None):
  status = Status(name, machine)
  if status == STOPPED:
    print "Starting %s ..." % name
    win32serviceutil.StartService(name, machine)
    status = Status(name, machine)
    while status != RUNNING:
      time.sleep(1)
      status = Status(name, machine)
  return status

Start("besclient")
