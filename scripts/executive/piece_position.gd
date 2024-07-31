extends Marker2D

var piece : Node2D
var front_position : Marker2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func is_empty() -> bool:
	return piece == null

func position_changed():
	if front_position.piece == null and piece != null:
		piece.global_position = front_position.global_position
		front_position.piece = piece
		self.piece = null
	pass
