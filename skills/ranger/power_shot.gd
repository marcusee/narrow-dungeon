class_name PowerShot
extends HeroSkill

@export var damage := 50

func _init():
	skill_type = Global.SkillType.TARGET

func invoke_skill(caster, dungeon_director, target):
	print("FIRE")
	pass
