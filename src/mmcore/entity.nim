import resource
import std / math

type
  Entity* = object
    name: string
    health: Resource
    armor: int
    magicResist: float


proc newEntity*(name: string, health: Natural, armor: int, magicResist: float): Entity {.inline.} =
  return Entity(name: name, health: newResource(health), armor: armor, magicResist: magicResist)


proc tick*(entity: Entity) =
  discard


proc health*(entity: Entity): Resource {.inline.} =
  return entity.health


proc name*(entity: Entity): string {.inline.} =
  return entity.name


proc armor*(entity: Entity): int {.inline.} =
  return entity.armor


const ARMOR_FACTOR = 0.06
const ARMOR_BASE = 1


proc applyArmor(damage: int, armor: int): int {.inline.} =
  return int((float(damage) * (1 - ARMOR_FACTOR * float(armor) / (ARMOR_BASE + ARMOR_FACTOR * abs(float(armor))))).round)


proc applyMagicResist(damage: int, magicResist: float): int {.inline.} =
  return int((float(damage) * (1 - magicResist)).round)


proc damagePhysical*(entity: var Entity, value: int) =
  entity.health.change(-value.applyArmor(entity.armor))


proc damageMagical*(entity: var Entity, value: int) =
  entity.health.change(-value.applyMagicResist(entity.magicResist))


proc heal*(entity: var Entity, value: int) =
  entity.health.change(value)
