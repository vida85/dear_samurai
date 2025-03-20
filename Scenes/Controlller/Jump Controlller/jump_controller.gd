class_name Jump
extends Node


@export_group("Jump Settings")
@export var force: float = -320.0


func apply_jump(player: CharacterBody2D):
	player.velocity.y = force
