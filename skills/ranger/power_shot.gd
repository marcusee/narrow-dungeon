class_name PowerShot
extends HeroSkill

@export var damage := 25

func _init():
	skill_type = Global.SkillType.TARGET

func invoke_skill(caster, dungeon_director, target):
	var _damagable = target.get_node('Damagable')
	if _damagable != null:
		_damagable.take_damage(damage)
	pass
