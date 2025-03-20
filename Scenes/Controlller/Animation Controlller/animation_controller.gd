class_name AnimationController
extends Node

@export_group("Attach Character")
@export var player: Player

@export var animation_player: AnimationPlayer
# Movement Controller
@export var movement: Movement
var sprite_position: float


func _ready() -> void:
	sprite_position = movement.animated_sprite.position.x
	animation_player.play("Idle")


func _physics_process(delta: float) -> void:
	play_animation(get_animation(movement.direction))


func play_animation(animation_name: String) -> void:
	if animation_player.get_animation(animation_name):
		animation_player.play(animation_name)


func get_animation(direction: float) -> String:
	if player.velocity.y > 0.0:
		if player.is_on_wall():
			movement.animated_sprite.position.x = direction * 5
			return "Wall_Slide"
		else:
			movement.animated_sprite.position.x = sprite_position
			return "Jump_Fall"
	else:
		if player.is_on_wall():
			movement.animated_sprite.position.x = direction * 5
			return "Wall_Contact"
		elif player.velocity.y < 0.0:
			movement.animated_sprite.position.x = sprite_position
			return "Jump_Start"

	if direction != 0.0:
		if movement.speed == movement.walk_speed:
			return "Walk"
		else:
			return "Run"
	else:
		return "Idle"
