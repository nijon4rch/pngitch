import
  std/strutils

proc getRam*(): string =
  let
    fileSeq: seq[string] = "/proc/meminfo".readLines(16)
  
  let
    memTotalString = fileSeq[0].split(" ")[^2]
    memAvailableString = fileSeq[2].split(" ")[^2]
    swapTotalString = fileSeq[14].split(" ")[^2]
    swapAvailableString = fileSeq[15].split(" ")[^2]
  
    memTotalInt = memTotalString.parseUInt div 1024
    memAvailableInt = memAvailableString.parseUInt div 1024
    swapTotalInt = swapTotalString.parseUInt div 1024
    swapAvailableInt = swapAvailableString.parseUInt div 1024
  
    memUsedInt = memTotalInt - memAvailableInt
    swapUsedInt = swapTotalInt - swapAvailableInt
  
  result = $(memUsedInt) & "/" & $(memTotalInt) & " | " & $(swapUsedInt) & "/" & $(swapTotalInt) & " MiB"
  
  
proc getRam_MB*(): string =
  let
    fileSeq: seq[string] = "/proc/meminfo".readLines(3)
  
  let
    memTotalString = fileSeq[0].split(" ")[^2]
    memAvailableString = fileSeq[2].split(" ")[^2]
    swapTotalString = fileSeq[14].split(" ")[^2]
    swapAvailableString = fileSeq[15].split(" ")[^2]
  
    memTotalInt = memTotalString.parseUInt div 1000
    memAvailableInt = memAvailableString.parseUInt div 1000
    swapTotalInt = swapTotalString.parseUInt div 1000
    swapAvailableInt = swapAvailableString.parseUInt div 1000
  
    memUsedInt = memTotalInt - memAvailableInt
    swapUsedInt = swapTotalInt - swapAvailableInt
  
  result = $(memUsedInt) & "/" & $(memTotalInt) & " | " & $(swapUsedInt) & "/" & $(swapTotalInt) & " MB"
