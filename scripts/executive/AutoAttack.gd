extends Area2D

var _piece_in_range = null
@export var damage := 5
@onready var team = get_parent().team

# Called when the node enters the scene tree for the first time.
func _ready():
	#if team == Global.TEAM.Mob:
		#position.y = position.y * -1
	self.area_entered.connect(self._on_body_entered)
	self.area_exited.connect(self._on_body_exit)
	
	$Timer.start()
	$Timer.timeout.connect(_attack)
	$Timer.wait_time = 2
	
	var view = get_parent().get_node("./Sprite2D")
	if $MeleeAnimation:
		$MeleeAnimation.sprite = view
		if team == Global.TEAM.Mob:
			$MeleeAnimation.direction = -1

	#RenderingServer.set_debug_generate_wireframes(true)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_body_entered(body):
	_piece_in_range = body.get_parent()
	$Timer.start()

	print(_piece_in_range.name)
		
func _on_body_exit(body):
	_piece_in_range = null
	$Timer.stop()
	
func _attack():
	if _piece_in_range == null:
		return
	if $MeleeAnimation:
		$MeleeAnimation.start_animation()

	_piece_in_range.take_damage(damage)
