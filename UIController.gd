extends Control

signal play_skill(skill)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func handleSkill():
	
	pass

func _on_skill_1_button_up():
	play_skill.emit({
		"skillName": "Stun"	
	})
	pass # Replace with function body.
