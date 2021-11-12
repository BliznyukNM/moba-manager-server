type
  Counter* = object
    max: int
    current: int


proc isReady*(counter: Counter): bool =
  return counter.current > 0


proc tick*(counter: var Counter): void =
  if counter.isReady: return
  counter.current.inc()
