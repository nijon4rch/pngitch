import
  std/[terminal, base64, os],
  getDistroId,
  ../nitches/[getUser, getDistro,
                  getWm, getKernel,
                  getAge, getShell,
                  getPkgs, getRam,
                  getBatt, getLogo]  # import nitches to get info about user system

# the main function for drawing fetch
proc drawInfo*(logo: int, value: string) =
  let distroId = getDistroId()

  let coloredLogo = getLogo(distroId)

  let moveCur = if logo == 1: "\x1b[29C" else: ""

  const  # icons
    userIcon   = " "
    distroIcon = "󰻀 "
    wmIcon     = " "
    kernelIcon = "󰌢 "
    ageIcon    = "󰦖 "
    shellIcon  = " "
    pkgsIcon   = "󰏖 "
    ramIcon    = "󰍛 "
    battIcon   = "󱊢 "
    colorsIcon = "󰏘 "
    # please insert any char after the icon
    # to avoid the bug with cropping the edge of the icon

    dotIcon = ""
    # icon for color demonstration

  const  # categories
    userCat   = " user   │ "
    distroCat = " distro │ "
    wmCat     = " WM     │ "
    kernelCat = " kernel │ "
    ageCat    = " OS age │ "
    shellCat  = " shell  │ "
    pkgsCat   = " pkgs   │ "
    ramCat    = " memory │ "
    battCat   = " batt   │ "
    colorsCat = " colors │ "

  let  # info
    userInfo     = getUser()          # get user through $USER env variable and hostname through /etc/hostname
    distroInfo   = getDistro()        # get distro through /etc/os-release
    wmInfo       = getWm()            # get window manager through $XDG_CURRENT_DESKTOP env variable
    kernelInfo   = getKernel()        # get kernel through /proc/version
    ageInfo      = getAge()           # get system age
    shellInfo    = getShell()         # get shell through $shell env variable
    pkgsInfo     = getPkgs(distroId)  # get amount of packages in distro
    ramInfo      = getRam()           # get ram and swap through /proc/meminfo
    battInfo     = getBatt()          # get battery level of battery BAT0 through /sys/class/power_supply/BAT0/capacity

  const  # aliases for colors
    color1 = fgRed
    color2 = fgYellow
    color3 = fgGreen
    color4 = fgCyan
    color5 = fgBlue
    color6 = fgMagenta
    color7 = fgWhite
    color8 = fgBlack
    color0 = fgDefault

  # print fetch with ascii art
  if logo == 2:
    stdout.styledWrite(styleBright, coloredLogo[0], coloredLogo[1], color0)
  # print fetch with warning
  if logo == 0:
    stdout.write(value)

  stdout.write("\n")
  stdout.write(moveCur)
  stdout.styledWrite(styleBright, "  ╭───────────╮\n")
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color1, userIcon, color0, userCat, color1, userInfo, color0)
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color4, distroIcon, color0, distroCat, color4, distroInfo, color0, "\n")
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color4, wmIcon, color0, wmCat, color4, wmInfo, color0, "\n")
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color3, kernelIcon, color0, kernelCat, color3, kernelInfo, color0, "\n")
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color3, ageIcon, color0, ageCat, color3, ageInfo, color0, "\n")
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color2, shellIcon, color0, shellCat, color2, shellInfo, color0, "\n")
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color2, pkgsIcon, color0, pkgsCat, color2, pkgsInfo, color0, "\n")
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color6, ramIcon, color0, ramCat, color6, ramInfo, color0, "\n")
  stdout.write(moveCur)
  if fileExists("/sys/class/power_supply/BAT0/capacity"):
    stdout.styledWrite("  │ ", color6, battIcon, color0, battCat, color6, battInfo, color0)
    stdout.write(moveCur)
  stdout.styledWrite("  ├───────────┤\n")
  stdout.write(moveCur)
  stdout.styledWrite("  │ ", color7, colorsIcon, color0, colorsCat, color7, dotIcon, " ", color1, dotIcon, " ", color2, dotIcon, " ", color3, dotIcon, " ", color4, dotIcon, " ", color5, dotIcon, " ", color6, dotIcon, " ", color8, dotIcon, color0, "\n")
  stdout.write(moveCur)
  stdout.styledWrite("  ╰───────────╯\n\n")

    #Print fetch with image
  if logo == 1:
    # if printing with logo, 'value' is path to image
    if not fileExists(value):
      stdout.write("File doesn't exist: " & value)
    else:
      let encodedImg = encode(readFile(value))
      let escStart = "\x1b[14A\x1b_Ga=T,f=100,r=14;"
      stdout.write(escStart & encodedImg)
