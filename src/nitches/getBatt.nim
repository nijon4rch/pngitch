import os

proc getBatt*(): string =
  let batt = if fileExists("/sys/class/power_supply/BAT0/capacity"): readFile("/sys/class/power_supply/BAT0/capacity") else: "Battery not available!"
  result = batt
