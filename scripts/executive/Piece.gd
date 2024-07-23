extends Node2D

@export var level: int = 1
@export var skills: Array[HeroSkill] = []
@export var skill_cooldown = [5,5,5]
@onready var skill_book : Node2D = $SkillBook

var team = Global.TEAM.Mob
# Called when the node enters the scene tree for the first time.
func _ready():
	var deathFade = $DeathFade
	if deathFade and $Sprite2D:
		$DeathFade.sprite = $Sprite2D
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func take_damage(damage):
	var _damagable = $Damagable
	if _damagable != null:
		_damagable.take_damage(damage)
		
func die():
	if $DeathFade:
		$DeathFade.start_fade_out()
	
