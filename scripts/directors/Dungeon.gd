extends Node2D

@onready var player_party = $PlayerParty
@onready var enemies = $Enemies
@onready var skill_manager = $SkillManager
@onready var mob_manager = $MobManager
@onready var hero_manager = $HeroManager
@onready var postiion_manager = $PositionManager
@onready var piece_resource = $PieceResource


@onready var selected_hero : Node2D = $HeroManager/Hero

enum DungeonState {
	NORMAL,
	TARGETING,
	HELPING,
}

var _state : DungeonState = DungeonState.NORMAL

# Called when the node enters the scene tree for the first time.
func _ready():
	skill_manager.set_selected_hero(selected_hero)
	skill_manager.play_skill.connect(play_skill)
	skill_manager.set_targeting.connect(set_targetting)
	skill_manager.set_helping.connect(set_helping)
	mob_manager.enemy_clicked.connect(enemy_clicked)
	hero_manager.piece_clicked.connect(hero_clicked)
	
	piece_resource.hire_mob("Crab")
	postiion_manager.update_positions()
	

func _input(event):
	# Check if the event is a mouse button event
	if event is InputEventMouseButton:
		# Reset state
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			if _state == DungeonState.TARGETING or _state == DungeonState.HELPING:
				_state = DungeonState.NORMAL
			
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

#func _on_ui_controller_play_skill(caster, skill):
	#print(skill.skill_name)
	#if skill.skill_type == Global.SkillType.ACTIVE:
		#skill.invoke_skill(caster, self, null)

func play_skill(caster, skill):
	print(skill.skill_name)
	if skill.skill_type == Global.SkillType.ACTIVE:
		skill.invoke_skill(caster, self, null)
		
func set_targetting():
	_state = DungeonState.TARGETING
	
func set_helping():
	_state = DungeonState.HELPING
	
func hero_clicked(hero):
	if _state == DungeonState.NORMAL:
		selected_hero = hero
		skill_manager.set_selected_hero(selected_hero)
	if _state == DungeonState.HELPING:
		skill_manager.active_skill.invoke_skill(selected_hero, self, hero)
		skill_manager.release_active_skill()
		_state = DungeonState.NORMAL
	
