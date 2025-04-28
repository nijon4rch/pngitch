import
  std/os

proc getUser*(): string =
  let
    hostname = readFile("/etc/hostname")
  result = getEnv("USER") & "@" & hostname
