import unit, resource


type
  Creep* = ref object
    unit*: Unit


proc newCreep*(): Creep {.inline.} =
  Creep(unit: newUnit("creep", 100, 100, 2, 0.13))


proc name*(creep: Creep): string {.inline.} =
  creep.unit.name


proc health*(creep: Creep): Resource {.inline.} =
  creep.unit.health


proc mana*(creep: Creep): Resource {.inline.} =
  creep.unit.mana


proc armor*(creep: Creep): int {.inline.} =
  creep.unit.armor


proc tick*(creep: Creep) =
  creep.unit.tick()
