import resource
import std / math

type
  Entity* = object
    name: string
    health: Resource
    armor: int


proc newEntity*(name: string, health: Natural,
                armor: int): Entity {.inline.} =
  return Entity(name: name, health: newResource(health), armor: armor)


proc tick*(entity: Entity) =
  discard


proc health*(entity: Entity): Resource {.inline.} =
  return entity.health


proc name*(entity: Entity): string {.inline.} =
  return entity.name


proc armor*(entity: Entity): int {.inline.} =
  return entity.armor


proc applyArmor*(damage: int, armor: int): int {.inline.} =
  return int(float(damage) * (0.0625 + 1.5 / (0.6 + pow(E, 0.05 * float(armor)))))


proc damagePhysical*(entity: var Entity, value: int) =
  entity.health.change(-value.applyArmor(entity.armor))


proc heal*(entity: var Entity, value: int) =
  entity.health.change(value)
