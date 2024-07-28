extends Node2D

@export var enemy_manager : Node2D
@export var position_manager : Node2D

@onready var piece_candidates = $PieceCandidate
# Called when the node enters the scene tree for the first time.
func _ready():
	DMail.connect("mob_died", fire_mob)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func hire_mob(mob):
	var enemy = piece_candidates.get_node(mob).duplicate()
	enemy_manager.onboard_mob(enemy)
	position_manager.update_positions()
	
func fire_mob(mob):
	print("DIED")
	mob.queue_free()
	hire_mob("Crab")
	position_manager.update_positions()
	pass
