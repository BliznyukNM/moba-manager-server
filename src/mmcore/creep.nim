import entity


type
  Creep* = object
    unit: Unit


proc tick*(creep: Creep) =
  creep.unit.tick()
