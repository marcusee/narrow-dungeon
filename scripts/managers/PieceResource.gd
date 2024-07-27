extends Node2D

@export var enemy_manager : Node2D
@export var position_manager : Node2D

@onready var piece_candidates = $PieceCandidate
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func hire_mob(mob):
	var enemy = piece_candidates.get_node(mob).duplicate()
	enemy_manager.add_child(enemy)
	position_manager.update_positions()
