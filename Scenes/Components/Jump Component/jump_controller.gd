extends Node

@export_group("Attach Character")
@export var player: Player

@export_group("Jump Settings")
@export var force: float = -320.0

@export_group("Jump Input")
@export var jump: String = "p1_jump"


func _physics_process(delta: float) -> void:
	if player.is_on_floor():
		if Input.is_action_just_pressed(jump):
			apply_jump(force)


func apply_jump(jump_force: float):
	player.velocity.y = jump_force
