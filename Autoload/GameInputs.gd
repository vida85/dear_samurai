extends Node

signal pressed(button_name: String)

@export_group("Movement Input")
var left: String = "p1_left"
var right: String = "p1_right"
var run: String = "p1_run"

@export_group("Jump Input")
var jump: String = "p1_jump"

@export_group("Dash Input")
var dash: String = "p1_dash"


func _input(event: InputEvent) -> void:
	if event.is_action(left):
		pressed.emit(left)
