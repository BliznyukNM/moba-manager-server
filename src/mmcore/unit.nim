import resource, entity

type
  Unit* = ref object
    entity*: Entity
    mana: Resource


proc newUnit*(name: string, health: Natural, mana: Natural, armor: int, magicResist: float): Unit {.inline.} =
  Unit(entity: newEntity(name, health, armor, magicResist), mana: newResource(mana))


proc name*(unit: Unit): string {.inline.} =
  unit.entity.name


proc health*(unit: Unit): Resource {.inline.} =
  unit.entity.health


proc mana*(unit: Unit): Resource {.inline.} =
  unit.mana


proc armor*(unit: Unit): int {.inline.} =
  unit.entity.armor


proc tick*(unit: Unit) =
  unit.entity.tick()


proc damagePhysical*(unit: Unit, value: int) =
  unit.entity.damagePhysical(value)


proc damageMagical*(unit: Unit, value: int) =
  unit.entity.damageMagical(value)


proc damagePure*(unit: Unit, value: int) =
  unit.entity.damagePure(value)
