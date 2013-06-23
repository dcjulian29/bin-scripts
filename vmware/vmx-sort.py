import sys

filename = sys.argv[1]
lines = []

fp = open(filename, 'r')
for line in fp:
  if not line.strip():
    continue
  lines.append(line)
fp.close()

lines.sort()

fp = open(filename, 'w')
for line in lines:
  fp.write(line)
  fp.flush()
fp.close()