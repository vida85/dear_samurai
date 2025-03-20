class_name Player
extends CharacterBody2D

signal play_landing_sfx

@export var _stats: Resource
@onready var movement_controller: Movement = %MovementController

var health: int
var gravity: float
var hit_ground: bool = false

func _ready() -> void:
	health = _stats.health


func _physics_process(delta: float) -> void:
	if is_on_wall() and movement_controller.direction and velocity.y > 0.0:
		gravity = 100.0
	else:
		gravity = get_gravity().y

	if not is_on_floor():
		hit_ground = false
		velocity.y += gravity * delta
	else:
		if not hit_ground:
			play_landing_sfx.emit()
		hit_ground = true
