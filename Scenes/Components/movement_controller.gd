extends Node

@export var player: Player
var direction: float = 0.0
var speed: float



func _process(delta: float) -> void:
	if Input.is_action_pressed("run"):
		speed = player._stats.run_speed 
	else:
		speed = player._stats.walk_speed



func _physics_process(delta: float) -> void:
	direction = Input.get_axis("left", "right")
	player.velocity.x = movement(direction, speed)
	player.move_and_slide()



func movement(direction: float, speed: float) -> float:
	return direction * speed
