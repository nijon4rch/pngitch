func argParser*(args: seq[string], argCount: int): (int, string) =

  # list of constant args
  const
    argsList: array[8, string] = [
    "-h", "--help",
    "-v", "--version",
    "-a", "--ascii",
    "-l", "--logo"
    ]

  # return codes explanation:
  # 0 = draw fetch without additional parameters, provide warning if applicable
  # 5 = exit with error message
  # 1..4 = valid flag

  # if no flags provided, return 0 and no warning
  if argCount == 0:
    result = (0, "")

  else:
    # check first argument
    case args[0]:

    # if -h --help flags
    of argsList[0..1]:
      result = (1, "")

    # if -v --version flags
    of argsList[2..3]:
      result = (2, "")

    # if -a --ascii-art flags
    of argsList[4..5]:
      result = (3, "")

    # if -l --logo flags
    of argsList[6..7]:
      if argCount < 2:
        # if image path is not provided, return 5  and text of the error message
        result = (5, "Please provide image path!")
      else:
        result = (4, args[1])

    # if incorrect flag is provided, return 0 and warning
    else:
      result = (0, "Argument not recognized: " & $args[0])
