extends Node2D
signal enemy_clicked(mob)
# Called when the node enters the scene tree for the first time.
func _ready():
	for mob in get_children():
		var mob_area = mob.get_node('./Shape')
		mob_area.input_event.connect(_on_input_event.bind(mob))
		#mob_area.pressed.connect(on_mob_click())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_mob():
	pass

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int, mob : Node2D):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		enemy_clicked.emit(mob)
