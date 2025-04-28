import
  std/parsecfg,
  std/osproc,
  std/strutils

proc getDistro*(): string =
  let
    osRelease = "/etc/os-release".loadConfig.getSectionValue("", "PRETTY_NAME") 
    arch = execProcess("uname -m").strip()
 
  result = osRelease & " " & arch
