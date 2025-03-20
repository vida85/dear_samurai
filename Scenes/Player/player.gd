class_name Player
extends CharacterBody2D


@export var _stats: Resource
@onready var movement_controller: Movement = %MovementController

var health: int
var on_wall_slide: bool = false
var in_the_air: bool = false
var gravity: float


func _ready() -> void:
	health = _stats.health


func _physics_process(delta: float) -> void:
	if is_on_wall() and movement_controller.direction and velocity.y > 0.0:
		gravity = 100.0
	else:
		gravity = get_gravity().y

	if not is_on_floor():
		in_the_air = true
		velocity.y += gravity * delta
	else:
		in_the_air = false
