import resource

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
