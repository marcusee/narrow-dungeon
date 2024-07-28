extends Node2D

@export var hero_manager : Node2D = null
@export var enemy_manager: Node2D = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_positions():
	position_pieces(hero_manager, true)
	position_pieces(enemy_manager, false)
	
	pass
	
	
func position_pieces(manager : Node2D, from_bottom : bool):
	var markers = get_children()
	var pieces = manager.get_children()
	var piece_size = manager.get_child_count()
	var marker_size = get_child_count()
	if from_bottom:
		pieces.reverse()
		markers.reverse()
	
	for i in range(piece_size):
		pieces[i].global_position = markers[i].global_position
		
		markers[i].piece = pieces[i]

#func infront_has_space():
	

func _input(event):
	# Check if the event is a mouse button event
	if event is InputEventMouseButton:
		# Reset state
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			var markers = get_children()
			for marker in get_children():
				print(marker.is_empty())
