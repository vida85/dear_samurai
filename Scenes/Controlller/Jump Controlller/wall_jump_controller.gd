class_name WallJump
extends Node


@export_group("Jump Settings")
@export var force: float = -200.0
@export var wall_jump_force: float = -300.0


func is_wall_jump_available(player: CharacterBody2D, jump: bool) -> bool:
	if player.is_on_wall():
		if jump and not player.is_on_floor():
			return true
	return false


func apply_jump(player: CharacterBody2D, horizontal_direction: float) -> void:
	player.velocity = Vector2(force * horizontal_direction, wall_jump_force)
