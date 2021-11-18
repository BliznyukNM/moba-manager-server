import unittest
import mmcore / [entity, resource]


var e = newEntity("test", 300, 10, 0.25)


test "create":
  require(e.name == "test")
  require(e.health.max == 300)


test "damage physical":
  let previousHealth = e.health.current
  e.damagePhysical(100)
  require(previousHealth > e.health.current)


test "damage magical":
  let previousHealth = e.health.current
  e.damageMagical(100)
  require(previousHealth > e.health.current)


test "damage pure":
  let previousHealth = e.health.current
  e.damagePure(100)
  require(previousHealth > e.health.current)


test "heal":
  let previousHealth = e.health.current
  e.heal(10)
  require(previousHealth < e.health.current)


proc newEntity(magicResist: float): Entity =
  return newEntity("test", 300, 0, magicResist)


