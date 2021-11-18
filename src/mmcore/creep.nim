import unit, resource


type
  Creep* = object
    unit: Unit


proc newCreep*(): Creep {.inline.} =
  return Creep(unit: newUnit("creep", 100, 100, 2))


proc health*(creep: Creep): Resource {.inline.} =
  return creep.unit.health


proc mana*(creep: Creep): Resource {.inline.} =
  return creep.unit.mana


proc tick*(creep: Creep) =
  creep.unit.tick()
