class_name Player
extends CharacterBody2D


@export var _stats: Resource

var health: int

func _ready() -> void:
	health = _stats.health


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
