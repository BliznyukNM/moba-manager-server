import unittest
import mmcore / armor


suite "armor":
  test "0 -> 100%":
    check(100.applyArmor(0) == 100)
  test "1 -> 94%":
    check(100.applyArmor(1) == 94)
  test "2 -> 89%":
    check(100.applyArmor(2) == 89)
  test "3 -> 85%":
    check(100.applyArmor(3) == 85)
  test "4 -> 81%":
    check(100.applyArmor(4) == 81)
  test "5 -> 77%":
    check(100.applyArmor(5) == 77)
  test "-1 -> 106%":
    check(100.applyArmor(-1) == 106)
  test "-2 -> 111%":
    check(100.applyArmor(-2) == 111)
  test "-3 -> 115%":
    check(100.applyArmor(-3) == 115)
  test "-4 -> 119%":
    check(100.applyArmor(-4) == 119)
  test "-5 -> 123%":
    check(100.applyArmor(-5) == 123)

  test "armor stacking":
    check(sumArmor(5, 15, 3) == 23)

suite "magic resist":
  test "0% -> 100%":
    check(100.applyMagicResist(0) == 100)
  test "13% -> 87%":
    check(100.applyMagicResist(0.13) == 87)
  test "100% -> 0%":
    check(100.applyMagicResist(1) == 0)

  test "resist stacking":
    check(sumMagicResist(0.25, 0.3, 0.4) == 0.685)
