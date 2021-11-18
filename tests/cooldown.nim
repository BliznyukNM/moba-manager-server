import unittest
import mmcore / cooldown


const tickCount = 10
var cd = newCooldown(tickCount)


test "create":
  require(cd.max == tickCount)


test "activate":
  cd.activate()
  require(cd.isReady == false)
  require(cd.current == tickCount)


test "one tick":
  cd.tick()
  require(cd.current == tickCount - 1)


test "tick untill finished":
  for i in 1 ..< tickCount:
    cd.tick()
  require(cd.isReady)
