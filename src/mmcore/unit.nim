import resource, entity

type
  Unit* = object
    entity: Entity
    mana: Resource


proc newUnit*(name: string, health: Natural, mana: Natural, armor: int, magicResist: float): Unit {.inline.} =
  return Unit(entity: newEntity(name, health, armor, magicResist), mana: newResource(mana))


proc name*(unit: Unit): string {.inline.} =
  return unit.entity.name


proc health*(unit: Unit): Resource {.inline.} =
  return unit.entity.health


proc mana*(unit: Unit): Resource {.inline.} =
  return unit.mana


proc armor*(unit: Unit): int {.inline.} =
  return unit.armor


proc tick*(unit: Unit) =
  unit.entity.tick()
