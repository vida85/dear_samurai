extends Node

@export_category("TileMap Reference")
@export_group("Names")
@export var grass_name: String = "TileGrassLayer"
@export var dirt_name: String = "TileDirtLayer"

# RAYCAST
@onready var select_ground_sfx: RayCast2D = %SelectGroundSFX

# FOOTSTEPS
@onready var foot_steps_grass: AudioStreamPlayer = %FootSteps_Grass
@onready var foot_steps_dirt: AudioStreamPlayer = %FootSteps_Dirt

# LANDING
@onready var foot_steps_dirt_land: AudioStreamPlayer = %FootSteps_DirtLand
@onready var foot_steps_grass_land: AudioStreamPlayer = %FootSteps_GrassLand


var sfx: AudioStreamPlayer
var sfx_name: String

func play_footsteps():
	match sfx_name:
		grass_name:
			sfx = foot_steps_grass
		dirt_name:
			sfx = foot_steps_dirt
		_:
			sfx = foot_steps_grass
	sfx.play()


func play_landing():
	match sfx_name:
		grass_name:
			sfx = foot_steps_grass_land
		dirt_name:
			sfx = foot_steps_dirt_land
		_:
			sfx = foot_steps_dirt_land
	sfx.play()


func _process(delta: float) -> void:
	if select_ground_sfx.is_colliding():
		sfx_name = select_ground_sfx.get_collider().name


func _on_player_play_landing_sfx() -> void:
	play_landing()
