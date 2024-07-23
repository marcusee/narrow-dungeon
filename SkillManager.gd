extends Control

signal play_skill(caster, skill)
signal set_targeting()

var selected_hero : Node2D = null

# when targeting we use this skill
var active_skill : Skill = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func handleSkill():
	pass
	
func set_selected_hero(hero: Node2D):
	selected_hero = hero
	var skill_book = hero.skill_book
	var panel = $SkillPanel
	
	# Clear current skill
	for row in get_node('SkillPanel').get_children():
		var button = row.get_node('./SKILL')
		button.text = ""
		if button.button_up.is_connected(_on_skill_pressed):
			button.button_up.disconnect(_on_skill_pressed)
	
	var i = 0
	for skill in skill_book.skillList:
		var skill_button = panel.get_children()[i].get_node('./SKILL')
		skill_button.text = skill.skill_name
		#skill_button.font_size = 5
		#skill_button.set_size(Vector2(4, 4))
		skill_button.button_up.connect(_on_skill_pressed.bind(skill))

		#skill_button.pressed.
		i = i + 1
		
	
	#for row in panel.get_children():
		#var skill_button = row.get_node('./SKILL')
		#print(skill_button.name)

func _on_skill_pressed(skill):
	if skill.skill_type == Global.SkillType.TARGET:
		active_skill = skill
		set_targeting.emit()
	else:
		play_skill.emit(selected_hero, skill)
	pass
	
func release_active_skill():
	active_skill = null
	pass
