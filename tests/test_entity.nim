import unittest
import mmcore / [entity, resource]


suite "entity":
  var e = newEntity("test", 300, 10, 0.13)


  test "create":
    require(e.name == "test")
    require(e.health.max == 300)


  test "damage physical":
    let previousHealth = e.health.current
    e.damagePhysical(100)
    require(previousHealth > e.health.current)


  test "heal":
    let previousHealth = e.health.current
    e.heal(10)
    require(previousHealth < e.health.current)


proc newEntity(magicResist: float): Entity =
  return newEntity("test", 300, 0, magicResist)


proc newEntity(armor: int): Entity =
  return newEntity("test", 300, armor, 0)


suite "armor":

  test "armor 4, hit by 10 = 9 damage":
    var e = newEntity(4)
    e.damagePhysical(10)
    check(e.health.current == 291)


  test "armor 10, hit by 15 = 11 damage":
    var e = newEntity(10)
    e.damagePhysical(15)
    check(e.health.current == 289)


  test "armor -5, hit by 125 = 144 damage":
    var e = newEntity(-5)
    e.damagePhysical(125)
    check(e.health.current == 156)
    

  test "armor -10, hit by 100 = 131 damage":
    var e = newEntity(-10)
    e.damagePhysical(100)
    check(e.health.current == 169)


suite "magic resist":

  test "mr 13%, hit by 10 = 9 damage":
    var e = newEntity(0.13)
    e.damageMagical(10)
    check(e.health.current == 291)
