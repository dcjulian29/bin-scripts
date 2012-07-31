@setlocal enableextensions & C:\python\python.exe -x %~f0 %* & goto :EOF
import base64
import sys
import getopt

# Parse Command Line Options
try:
    opts, args = getopt.getopt(sys.argv[1:], "hedf", ["help", "encode", "decode", "file"])
except getopt.error, msg:
    print msg
    print "for help use --help"
    sys.exit(2)
# Process Options
for o, a in opts:
    if o in ("-h", "--help"):
        print "Usage: base64.py -e [text] to encode"
        print "       base64.py -d [text] to decode"
        print "       Alternatively, you can replace [text] with -f [filename]"
        sys.exit(0)
    if o in ("-e", "--encode"):
        action = "+"
    if o in ("-d", "--decode"):
        action = "-"
    if o in ("-f", "--file"):
        file = "YES"

# Process Arguments
for arg in args:
    if file == "YES":
        f = open(arg,'r')
        theString = f.read()
    else:
        theString = arg

    if action == "+":
        print base64.encodestring(theString)
    if action == "-":
        print base64.decodestring(theString)
