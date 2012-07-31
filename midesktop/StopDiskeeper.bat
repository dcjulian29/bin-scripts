@setlocal enableextensions & C:\Python\python.exe -x %~f0 %* & goto :EOF

import time
import win32service
import win32serviceutil

RUNNING = win32service.SERVICE_RUNNING
STOPPED = win32service.SERVICE_STOPPED

def Status(name, machine=None):
  return win32serviceutil.QueryServiceStatus(name, machine)[1]

def Stop(name, machine=None):
  status = Status(name, machine)
  if status == RUNNING:
    print "Stopping %s..." % name
    status = win32serviceutil.StopService(name, machine)[1]
    while status != STOPPED:
      time.sleep(1)
      status = Status(name, machine)
  return status


Stop("Diskeeper")
