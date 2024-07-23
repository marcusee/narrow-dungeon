extends Node2D
var sprite: CanvasItem
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_animation():
	#if sprite == null:
		#return
	var tween = create_tween()
	tween.tween_property(sprite, "position", Vector2(0, -4 * direction), 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
	tween.tween_property(sprite, "position", Vector2(0,  0), 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
