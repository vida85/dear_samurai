class_name WallJump
extends Node


@export_group("Jump Settings")
@export var force: float = -450.0
@export var wall_jump_force: float = -350.0


func is_wall_jump_available(player: CharacterBody2D, jump: bool, direction: float) -> bool:
	if player.is_on_wall():
		if jump and not player.is_on_floor():
			return true
	return false


func apply_jump(player: CharacterBody2D, horizontal_direction: float) -> void:
	player.velocity = Vector2(force * horizontal_direction, wall_jump_force)
	await get_tree().create_timer(.25).timeout
	player.on_wall_slide = false
