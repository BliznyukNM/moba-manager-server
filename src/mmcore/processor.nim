type
  IEntity* = concept x
    tick x


proc process*(entities: seq[IEntity]) {.inline.} =
  for entity in entities:
    entity.tick()
