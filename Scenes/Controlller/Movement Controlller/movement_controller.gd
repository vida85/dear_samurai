class_name Movement
extends Node


@export_group("Movement Settings")
@export var walk_speed: float = 2.0
@export var run_speed: float = 4.0

@onready var sprite: AnimatedSprite2D = %AnimatedSprite
var direction: float = 0.0
var speed: float


func get_direction(right: float, left: float) -> void:
	direction = right - left


func flip_sprite(dir: float) -> void:
	sprite.flip_h = false if dir > 0 else true


func get_speed(run: bool) -> float:
	if direction:
		if run:
			return run_speed 
		else:
			return walk_speed
	return 0.0
