import unittest
import mmcore / [entity, creep]

suite "creeps spawning":
  let creeps = @[Creep(), Creep()]

  test "tick":
    creeps.process()
