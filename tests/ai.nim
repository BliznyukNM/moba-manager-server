# import unittest
import mmcore / [creep, unit]
import mmcore / ai / lanecreep


var creepA = newCreep()
var creepB = newCreep()
var bot = newLaneCreepAI(creepA)
bot.setTarget(creepB.unit.entity)
echo creepA.armor
