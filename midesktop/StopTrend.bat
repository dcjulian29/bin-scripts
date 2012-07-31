@setlocal enableextensions & C:\Python\python.exe -x %~f0 %* & goto :EOF
import os
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


os.system("taskkill /im TMListen.exe /f")
time.sleep(1)
Stop("tmlisten")
Stop("ds_agent")
Stop("ntrtscan")
#Stop("TmPfw")
Stop("TMAdptrSvr")
os.system("taskkill /im PccNTMon.exe /f")