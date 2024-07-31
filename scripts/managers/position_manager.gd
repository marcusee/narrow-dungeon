extends Node2D

@export var hero_manager : Node2D = null
@export var enemy_manager: Node2D = null
@onready var markers = get_children()

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

func move_enemies_down():
	var markers = get_children()
	markers.reverse()
	
	var i = 0
	for marker in markers:
		if marker.is_empty() and i + 1 != 8:
			if markers[i+1].piece:
				markers[i+1].piece.global_position = markers[i].global_position
				markers[i].piece = markers[i + 1].piece
				markers[i+1].piece = null
		i = i + 1
	#for marker in markers:
		#if marker.is_empty():
			#empty_location = 1
		#location = location + 1
		#
	#var pieces = enemy_manager.get_children()
	#for i in range(empty_location):
		#print(pieces[i].global_position)
		#pieces[i].global_position =  markers[i + 1].global_position
		
	
func entrance(mob):
	mob.global_position = markers[0].global_position
	markers[0].piece = mob

func is_entrance_empty() -> bool:
	return markers[0].piece == null

func _input(event):
	# Check if the event is a mouse button event
	if event is InputEventMouseButton:
		# Reset state
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			move_enemies_down()
			#print(get_child(0).name)
			#for marker in get_children():
				#print(marker.is_empty())
