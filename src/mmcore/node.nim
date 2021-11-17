import entity

type
  LaneNode* = object
    creeps*: seq[Creep]
    heroes*: seq[Hero]
    towers*: seq[Tower]

  JungleNode* = object
    creeps*: seq[Creep]
    heroes*: seq[Hero]

  ThroneNode* = object
    heroes*: seq[Hero]
    towers*: seq[Tower]
    throne*: Throne


proc newLaneNode*(): LaneNode =
  return LaneNode(towers: @[
      Tower(), Tower(), Tower(), 
      Tower(), Tower(), Tower()])


proc newJungleNode*(): JungleNode =
  return JungleNode()


proc newThroneNode*(): ThroneNode =
  return ThroneNode(
    towers: @[Tower(), Tower()],
    throne: Throne()
  )


proc tick(node: LaneNode) =
  node.creeps.process()
  node.heroes.process()
  node.towers.process()


proc tick(node: JungleNode) =
  node.creeps.process()


proc tick(node: ThroneNode) =
  node.heroes.process()
  node.towers.process()
  node.throne.tick()


type
  INode* = concept x
    tick x


proc process*(nodes: seq[INode]) =
  for node in nodes:
    node.tick()
