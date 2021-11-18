import unittest
import mmcore / [creep, resource]


let c = newCreep()


test "create":
  require(c.health.max == 100)
  require(c.health.current == 100)
  require(c.mana.max == 100)
  require(c.mana.current == 100)
