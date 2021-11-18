import ".." / [creep, entity]


type
  LaneCreepAI* = object
    creep: Creep
    target: Entity


proc newLaneCreepAI*(creep: Creep): LaneCreepAI {.inline.} =
  LaneCreepAI(creep: creep)


proc setTarget*(ai: var LaneCreepAI, target: Entity) =
  ai.target = target


proc tick*(ai: var LaneCreepAI) =
  if ai.target != nil:
    ai.target.damagePhysical(10)
