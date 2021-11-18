import unit, resource


type
  Creep* = object
    unit: Unit


proc newCreep*(): Creep {.inline.} =
  return Creep(unit: newUnit("creep", 100, 100, 2))


proc name*(creep: Creep): string {.inline.} =
  return creep.unit.name


proc health*(creep: Creep): Resource {.inline.} =
  return creep.unit.health


proc mana*(creep: Creep): Resource {.inline.} =
  return creep.unit.mana


proc armor*(creep: Creep): int {.inline.} =
  return creep.unit.armor


proc tick*(creep: Creep) =
  creep.unit.tick()
