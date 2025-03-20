class_name Idle
extends State

var _animation: AnimationController


func physic_update(_delta: float):
	_animation.play_animation("Idle")
