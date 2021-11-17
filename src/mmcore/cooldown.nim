type
  Cooldown* = object
    max: Natural
    current: Natural


proc max*(cooldown: Cooldown): int =
  return cooldown.max


proc current*(cooldown: Cooldown): int =
  return cooldown.current


proc newCooldown*(max: Natural): Cooldown =
  return Cooldown(max: max)


proc isReady*(cooldown: Cooldown): bool =
  return cooldown.current == 0


proc activate*(cooldown: var Cooldown) =
  if cooldown.isReady == false: return
  cooldown.current = cooldown.max


proc reset*(cooldown: var Cooldown) =
  cooldown.current = 0


proc tick*(cooldown: var Cooldown): void =
  if cooldown.isReady: return
  dec cooldown.current
