extends Node

@export var initial_state: State

var current_state: State
var states: Dictionary = {}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.change.connect(on_child_change)
	if initial_state:
		initial_state.enter()
		current_state = initial_state


func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physic_update(delta)


func on_child_change(state, new_state_name):
	if state != current_state:
		return

	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	if current_state:
		current_state.exit()

	current_state.enter()
