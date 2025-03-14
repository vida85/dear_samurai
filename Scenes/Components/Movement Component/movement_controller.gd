extends Node

@export_group("Attach Character")
@export var player: Player

@export_group("Movement Input")
@export var left: String = "p1_left"
@export var right: String = "p1_right"
@export var forward: String = "p1_forward"
@export var backward: String = "p1_backward"
@export var run: String = "p1_run"

@export_group("Movement Settings")
@export var walk_speed: float = 2.0
@export var run_speed: float = 4.0
@export var jump_force: float = 2.5

var input_dir: Vector2
var direction: float = 0.0
var speed: float



func _process(delta: float) -> void:
	speed = get_speed()
	input_dir = Input.get_vector(left, right, forward, backward)
	direction = Input.get_axis(left, right)


func get_speed() -> float:
	if Input.is_action_pressed(run):
		return run_speed 
	else:
		return walk_speed


func _physics_process(delta: float) -> void:
	player.velocity.x = lerp(player.velocity.x, movement(direction, speed), 0.1)
	player.move_and_slide()


func movement(direction: float, speed: float) -> float:
	return direction * speed
