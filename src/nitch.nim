import
  std/os,
  flags/argParser,
  funcs/drawing,
  assets/assets

let
  arg = argParser(commandLineParams(), paramCount())

# process return of argParser
case arg[0]:

# if no flags
of 0:
  drawInfo(0, arg[1])

# if -h --help flags
of 1:
  stdout.write(helpMsg) # write to stdout helpMsg from nitch/assets/assets file

# if -v --version flags
of 2:
  stdout.write(programVersion) # write to stdout programVersion from nitch/assets/assets file

# if -a --ascii-art flags
of 3:
  drawInfo(2, "")

# if -l --logo flags
of 4:
  drawInfo(1, arg[1])

# if error in args
of 5:
  stdout.write(arg[1])

# should never happen
else:
  drawInfo(0, "")
