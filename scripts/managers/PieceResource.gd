extends Node2D

@export var enemy_manager : Node2D
@export var position_manager : Node2D

@onready var piece_candidates = $PieceCandidate
# Called when the node enters the scene tree for the first time.
func _ready():
	DMail.connect("mob_died", fire_mob)
	DMail.connect("hero_died",fire_mob)
	
	$Timer.start()
	$Timer.timeout.connect(_spawn)
	$Timer.wait_time = 10
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func hire_mob(mob_name):
	var enemy = piece_candidates.get_node(mob_name).duplicate()
	enemy_manager.onboard_mob(enemy)
	#position_manager.update_positions()
	return enemy

func hire_mob_walk_in(mob_name):
	var mob = hire_mob(mob_name)
	position_manager.entrance(mob)
	
func fire_mob(mob):
	#print("DIED")
	mob.queue_free()
	await mob.tree_exited
	call_deferred("move_enemies_down")
	pass
	
func move_enemies_down():
	position_manager.move_enemies_down()
	
func _spawn():
	if position_manager.is_entrance_empty():
		hire_mob_walk_in("Crab")
		position_manager.move_enemies_down()
		
	
	

