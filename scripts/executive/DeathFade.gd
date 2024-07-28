extends Node2D

var sprite : CanvasItem = null
#@onready var tween : Tween  = create_tween()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func start_fade_out():
	# Set up the initial and target values for the modulate property
	# Create the tween animation
	var tween : Tween  = create_tween().bind_node(sprite)
	tween.tween_property(sprite, "modulate:a", 0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	# Optionally, connect the tween's completion signal to perform an action after the fade-out
	tween.finished.connect(_on_tween_finished)

# Callback function when the tween animation is finished
# MARCUS: maybe we should pipe the data of mob down here
func _on_tween_finished():
	var mob = get_parent()
	if mob:
		DMail.mob_died.emit(mob)
