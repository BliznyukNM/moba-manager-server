import std / math


proc sumArmor*(armors: varargs[int]): int =
  for armor in armors: result += armor


proc applyArmor*(damage: int, armor: int): int {.inline.} =
  const ARMOR_FACTOR = 0.06
  const ARMOR_BASE = 1
  return int((float(damage) * (1 - ARMOR_FACTOR * float(armor) / (ARMOR_BASE + ARMOR_FACTOR * abs(float(armor))))).round)


proc applyMagicResist*(damage: int, magicResist: float): int {.inline.} =
  return int((float(damage) * (1 - magicResist)).round)
