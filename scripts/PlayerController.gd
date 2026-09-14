class_name PlayerController
extends CharacterBody2D

@export var speed: float = 260.0
@export var air_speed: float = 220.0
@export var jump_velocity: float = -420.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func play_animation(animation_name: StringName) -> void:
	if sprite.sprite_frames.has_animation(animation_name):
		sprite.play(animation_name)
