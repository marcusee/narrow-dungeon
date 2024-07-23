extends Node2D

@export var hp: int = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	_update_hp_ui()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func take_damage(damage):
	hp -= damage
	_update_hp_ui()

func _update_hp_ui():
	var label = $Hpcontrol/Label
	label.text = str(hp)
