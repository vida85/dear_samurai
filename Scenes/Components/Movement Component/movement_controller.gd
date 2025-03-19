class_name Movement
extends Node


@export_group("Attach Character")
@export var player: Player


@export_group("Movement Input")
@export var left: String = "p1_left"
@export var right: String = "p1_right"
@export var run: String = "p1_run"


@export_group("Movement Settings")
@export var walk_speed: float = 2.0
@export var run_speed: float = 4.0


var input_dir: Vector2
var direction: float = 0.0
var speed: float
var wall_sliding: bool = false
@onready var animated_sprite: AnimatedSprite2D = %AnimatedSprite



func _process(delta: float) -> void:
	speed = get_speed()
	direction = Input.get_axis(left, right)
	if direction:
		flip_sprite(direction)


func get_speed() -> float:
	if Input.is_action_pressed(run):
		return run_speed 
	else:
		return walk_speed


func flip_sprite(direction: float) -> void:
	animated_sprite.flip_h = false if direction > 0 else true


func _physics_process(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, direction * speed, 0.1)
	player.move_and_slide()
