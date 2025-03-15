extends Node


@export var animation_player: AnimationPlayer
# Movement Controller
@export var movement: Movement

@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"


func _ready() -> void:
	animation_player.play("Idle")

func _physics_process(delta: float) -> void:
	if movement.direction == 1.0:
		animated_sprite_2d.flip_h = false
	elif movement.direction == -1.0:
		animated_sprite_2d.flip_h = true
