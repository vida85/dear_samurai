extends Node

@export_group("Attach Character")
@export var player: Player

@export_group("Attach Movement Reference")
@export var movement: Movement

@export_group("Jump Input")
@export var jump: String = "p1_jump"

@export_group("Jump Settings")
@export var force: float = -920.0
@export var wall_jump_force: float = -350.0


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed(jump) and player.is_on_wall():
		apply_jump(force * movement.direction, wall_jump_force)


func apply_jump(horizontal_force: float, vertical_force: float):
	player.velocity = Vector2(horizontal_force, vertical_force)
