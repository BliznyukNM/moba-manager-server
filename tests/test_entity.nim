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

  template armorTest(armor: int, expectingHealth: int) =
    var e = newEntity(armor)
    e.damagePhysical(100)
    check(e.health.current == expectingHealth)

  test "armor 0 = 100% damage":
    armorTest(0, 300 - 100)
  test "armor 1 = 94% damage":
    armorTest(1, 300 - 94)
  test "armor 2 = 89% damage":
    armorTest(2, 300 - 89)
  test "armor 3 = 85% damage":
    armorTest(3, 300 - 85)
  test "armor 4 = 81% damage":
    armorTest(4, 300 - 81)
  test "armor 5 = 77% damage":
    armorTest(5, 300 - 77)
  test "armor -1 = 106% damage":
    armorTest(-1, 300 - 106)
  test "armor -2 = 111% damage":
    armorTest(-2, 300 - 111)
  test "armor -3 = 115% damage":
    armorTest(-3, 300 - 115)
  test "armor -4 = 119% damage":
    armorTest(-4, 300 - 119)
  test "armor -5 = 123% damage":
    armorTest(-5, 300 - 123)


suite "magic resist":

  test "mr 13%, hit by 10 = 9 damage":
    var e = newEntity(0.13)
    e.damageMagical(10)
    check(e.health.current == 291)
