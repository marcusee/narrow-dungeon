extends Node2D


@onready var player_party = $PlayerParty
@onready var enemies = $Enemies
@onready var skill_manager = $SkillManager
@onready var mob_manager = $MobManager
@onready var selected_hero : Node2D = $HeroManager/Tank/Hero

enum DungeonState {
	NORMAL,
	TARGETING,
	HELPING,
}

var _state : DungeonState = DungeonState.NORMAL

# Called when the node enters the scene tree for the first time.
func _ready():
	skill_manager.set_selected_hero(selected_hero)
	skill_manager.set_targeting.connect(set_targetting)
	mob_manager.enemy_clicked.connect(enemy_clicked)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _setup_actors():
	
	pass
	
func set_up_enemies():
	pass
	
func enemy_clicked(mob):
	if _state == Global.SkillType.TARGET:
		skill_manager.active_skill.invoke_skill(selected_hero, self, mob)
		skill_manager.release_active_skill()
		_state = DungeonState.NORMAL

func _on_ui_controller_play_skill(caster, skill):
	print(skill.skill_name)
	if skill.skill_type == Global.SkillType.ACTIVE:
		skill.invoke_skill(caster, self, null)


func _on_hero_selected(hero):
	if _state == DungeonState.NORMAL:
		selected_hero = hero
		skill_manager.set_selected_hero(selected_hero)
	#elif _state == DungeonState.TARGETING:
	
func set_targetting():
	_state = DungeonState.TARGETING
	
