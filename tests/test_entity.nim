import unittest
import mmcore / [entity, resource]


suite "entity":
  var e = newEntity("test", 300, 10)


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


suite "armor":

  test "armor 4, hit by 10 = 8 damage":
    var e = newEntity("test", 300, 4)
    e.damagePhysical(10)
    check(e.health.current == 292)


  test "armor 10, hit by 15 = 10 damage":
    var e = newEntity("test", 300, 10)
    e.damagePhysical(15)
    check(e.health.current == 290)


  test "armor -5, hit by 125 = 143 damage":
    var e = newEntity("test", 300, -5)
    e.damagePhysical(125)
    check(e.health.current == 157)
    

  test "armor -10, hit by 100 = 130 damage":
    var e = newEntity("test", 300, -10)
    e.damagePhysical(100)
    check(e.health.current == 170)
