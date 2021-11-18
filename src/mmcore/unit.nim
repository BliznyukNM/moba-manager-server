import resource, entity

type
  Unit* = object
    entity: Entity
    mana: Resource


proc newUnit*(name: string, health: Natural,
              mana: Natural, armor: int): Unit {.inline.} =
  return Unit(entity: newEntity(name, health, armor), mana: newResource(mana))


proc health*(unit: Unit): Resource {.inline.} =
  return unit.entity.health


proc mana*(unit: Unit): Resource {.inline.} =
  return unit.mana


proc tick*(unit: Unit) =
  unit.entity.tick()