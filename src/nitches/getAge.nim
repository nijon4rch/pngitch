import
  std/os,
  std/times,
  std/math

proc getAge*(): string =
  # Try common files/directories that indicate install time
  let possiblePaths = [
    "/lost+found",         # Root filesystem creation
    "/etc/hostname",       # Basic system config
    "/var/log/installer",  # Debian/Ubuntu installer logs
    "/root",               # Root user home
    "/",                   # Root filesystem as fallback
  ]
  
  var oldestTime = getTime() # Current time as initial value
  
  for path in possiblePaths:
    try:
      if fileExists(path) or dirExists(path):
        let creationTime = getFileInfo(path).creationTime
        if creationTime < oldestTime:
          oldestTime = creationTime
    except:
      continue
  
  # Calculate days between oldest time and now
  let 
    now = getTime()
    durationInSeconds = now - oldestTime
    days = int(durationInSeconds.inSeconds / (60 * 60 * 24))
  
  result = $days & " d"
