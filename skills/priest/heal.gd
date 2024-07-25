class_name Heal
extends HeroSkill

@export var heal_value := 20


func invoke_skill(caster, dungeon_director, target):
	target.heal(heal_value)
	pass
