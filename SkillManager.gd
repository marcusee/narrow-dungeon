extends Control

signal play_skill(skill)
var selected_hero : Node2D = null

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
	
	var i = 0
	for skill in skill_book.skillList:
		var skill_button = panel.get_children()[i].get_node('./SKILL')
		skill_button.text = skill.skill_name
		#skill_button.font_size = 5
		#skill_button.set_size(Vector2(4, 4))


		i = i + 1
		
	
	#for row in panel.get_children():
		#var skill_button = row.get_node('./SKILL')
		#print(skill_button.name)


func _on_skill_button_up():
	play_skill.emit({
		"skillName": "Stun"	
	})
	pass # Replace with function body.
