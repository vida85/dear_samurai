extends Node2D

@export_group("Attach Character")
@export var player: Player

@export_group("Jump Settings")
@export var jump_force: float = -320.0
@export var wall_jump_force: float = -250.0

@export_group("Jump Input")
@export var jump: String = "p1_jump"


@onready var ray_cast_left: RayCast2D = $RayCastLEFT
@onready var ray_cast_right: RayCast2D = $RayCastRIGHT

var on_left_wall: bool
var on_right_wall: bool


func _physics_process(delta: float) -> void:
	on_left_wall = true if ray_cast_left.is_colliding() else false
	on_right_wall = true if ray_cast_right.is_colliding() else false

	if Input.is_action_just_pressed(jump):
		if player.is_on_floor():
			apply_jump(jump_force)
		elif on_left_wall or on_right_wall:
			apply_jump(wall_jump_force)


func apply_jump(jump_force: float, wall_jump: bool = false):
	player.velocity.y += jump_force
