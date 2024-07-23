extends Node2D

signal piece_clicked
# Called when the node enters the scene tree for the first time.
func _ready():
	for hero in get_children():
		var shape = hero.get_node('./Shape')
		shape.input_event.connect(_on_input_event.bind(hero))
		
		hero.team = Global.TEAM.Heroes
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int, hero : Node2D):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		piece_clicked.emit(hero)
