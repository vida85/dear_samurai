class_name Dash
extends Node


@export var force: float = 950.0
var can_dash: bool = false


func is_dash_available(value: bool) -> bool:
	if value:
		return true
	else:
		return false


func dash(player: CharacterBody2D, horizontal_direction: float) -> void:
	var tween:= get_tree().create_tween()
	tween.tween_property(player, "velocity",  Vector2(force * horizontal_direction, 0), .15)
