extends TileMap

var tile_set_id = 1
var layer_id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_cell(layer_id, Vector2i(5,5), tile_set_id, Vector2i(0,0))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
