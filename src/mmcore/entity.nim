type
  Entity = object
    name: string
    health: int
    armor: int

type
  Unit* = object
    entity: Entity
    mana: int


proc health*(unit: Unit): int =
  return unit.entity.health


type
  Hero* = object
    unit: Unit

  Building = object
    entity: Entity

  Tower* = object
    building: Building
  
  Throne* = object
    building: Building


proc tick(entity: Entity) =
  discard
proc tick*(unit: Unit) =
  unit.entity.tick()
proc tick(hero: Hero) =
  hero.unit.tick()
proc tick(building: Building) =
  building.entity.tick()
proc tick(tower: Tower) =
  tower.building.tick()
proc tick*(throne: Throne) =
  throne.building.tick()


# Concept stuff

type
  IEntity* = concept x
    tick x


proc process*(entities: seq[IEntity]) =
  for entity in entities:
    entity.tick()
