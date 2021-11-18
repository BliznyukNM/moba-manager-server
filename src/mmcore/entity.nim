import resource, armor

type
  Entity* = ref object
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


proc damagePhysical*(entity: var Entity, value: int) =
  entity.health.change(-value.applyArmor(entity.armor))


proc damageMagical*(entity: var Entity, value: int) =
  entity.health.change(-value.applyMagicResist(entity.magicResist))


proc damagePure*(entity: var Entity, value: int) =
  entity.health.change(-value)


proc heal*(entity: var Entity, value: int) =
  entity.health.change(value)
