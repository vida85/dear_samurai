class_name Player
extends CharacterBody2D


@export var _stats: Resource

var health: int

func _ready() -> void:
	health = _stats.health
