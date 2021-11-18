import unittest
import mmcore / resource


const resourceMaxValue = 100
var r = newResource(resourceMaxValue)


test "create":
  require(r.max == resourceMaxValue)
  require(r.current == resourceMaxValue)


test "decrease":
  let currentValue = r.current
  const damage = 25
  r.change(-damage)
  require(r.current == currentValue - damage)


test "increase":
  let currentValue = r.current
  const heal = 15
  r.change(heal)
  require(r.current == currentValue + heal)


test "below 0":
  r.change(-9999)
  require(r.current == 0)


test "above max":
  r.change(9999)
  require(r.current == resourceMaxValue)
