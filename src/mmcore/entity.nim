type
  Entity = object
    name: string
    health: int
    armor: int

  Unit = object
    entity: Entity
    mana: int

  Hero* = object
    unit: Unit

  Creep* = object
    unit: Unit

  Building = object
    entity: Entity

  Tower* = object
    building: Building
  
  Barrack* = object
    building: Building


proc tick(entity: Entity) =
  echo "Entity"


proc tick(unit: Unit) =
  unit.entity.tick()
  echo "Unit"


proc tick*(creep: Creep) =
  creep.unit.tick()
  echo "Creep"


proc tick*(hero: Hero) =
  hero.unit.tick()
  echo "Hero"
