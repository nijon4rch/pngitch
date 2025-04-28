import
  std/os

func getWm*(): string =
  result = getEnv("XDG_CURRENT_DESKTOP")
