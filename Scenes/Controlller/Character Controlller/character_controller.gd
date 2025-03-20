extends Node

# Game Character
@export_category("Game Character")
@export var player: Player


# Movement Variables
@export_category("Movement Controller")
@export_group("Controller")
@export var move_controller: Movement

@export_group("Movement Input")
@export var left: String = "p1_left"
@export var right: String = "p1_right"
@export var run: String = "p1_run"
# Movement Variables


# Jump Variables
@export_category("Advanced Jump Controller")
@export_group("Jump Controller")
@export var jump_controller: Jump

@export_group("Wall Jump Controller")
@export var wall_jump_controller: WallJump

@export_group("Jump Input")
@export var jump: String = "p1_jump"
# Jump Variables


# Dash Variables
@export_category("Dash Controller")
@export_group("Controller")
@export var dash_controller: Dash

@export_group("Dash Input")
@export var dash: String = "p1_dash"
# Dash Variables


func _process(delta: float) -> void:
	get_movement_variables()
	apply_jump()
	handle_wall_jump()
	set_dash_variables()


func _physics_process(delta: float) -> void:
	apply_movement()
	apply_dash()


# Movement #####################
func apply_movement() -> void:
	if move_controller.direction:
		move_controller.flip_sprite(move_controller.direction)
	if not player.on_wall_slide:
		player.velocity.x = lerp(player.velocity.x, move_controller.direction * move_controller.speed, 0.1)
	player.move_and_slide()

func get_movement_variables() -> void:
	move_controller.speed = move_controller.get_speed(Input.is_action_pressed(run))
	move_controller.get_direction(Input.is_action_pressed(right), Input.is_action_pressed(left))
# Movement #####################


# Jump #########################
func apply_jump() -> void:
	if player.is_on_floor():
		if Input.is_action_just_pressed(jump):
			jump_controller.apply_jump(player)
# Jump #########################


# Wall Jump ####################
func handle_wall_jump() -> void:
	if wall_jump_controller.is_wall_jump_available(player, Input.is_action_just_pressed(jump), move_controller.direction):
		player.on_wall_slide = true
		wall_jump_controller.apply_jump(player, move_controller.direction)
# Wall Jump ####################


# Dash #########################
func set_dash_variables() -> void:
	dash_controller.can_dash = dash_controller.is_dash_available(Input.is_action_just_pressed(dash))

func apply_dash() -> void:
	if dash_controller.can_dash:
		dash_controller.dash(player, move_controller.direction)
# Dash #########################
