type
  Resource* = object
    current: int
    max: Natural


proc newResource*(max: Natural): Resource =
  return Resource(current: max, max: max)


proc current*(resource: Resource): int =
  return resource.current


proc max*(resource: Resource): int =
  return resource.max


proc change*(resource: var Resource, delta: int) =
  resource.current = clamp(resource.current + delta, 0, resource.max)
