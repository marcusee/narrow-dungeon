extends Node2D


@onready var player_party = $PlayerParty
@onready var enemies = $Enemies
@onready var skill_manager = $SkillManager


@onready var selected_hero : Node2D = $HeroManager/Tank/Hero

# Called when the node enters the scene tree for the first time.
func _ready():
	skill_manager.set_selected_hero(selected_hero)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _setup_actors():
	
	pass
	
func set_up_enemies():
	pass

func _on_ui_controller_play_skill(skill):
	print(skill.skillName)
	pass # Replace with function body.


func _on_hero_selected(hero):
	print(hero.hp)
	
	selected_hero = hero
	skill_manager.set_selected_hero(selected_hero)
	pass # Replace with function body.
