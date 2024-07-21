extends Node2D

@export var hp: int = 50
@export var level: int = 1
@export var hero_name : String = "John"
@export var skills: Array[HeroSkill] = []

@export var skill_cooldown = [5,5,5]

@onready var skill_book : Node2D = $SkillBook

enum HeroClass {
	KNIGHT,
	RANGER,
}

@export var hero_class := HeroClass.KNIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
