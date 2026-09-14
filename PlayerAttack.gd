class_name PlayerAttack
extends State

var finished: bool = false

func enter(_msg: Dictionary = {}) -> void:
	finished = false
	player.velocity.x = 0.0
	player.play_animation("attack")
	_wait_animation()

func _wait_animation() -> void:
	await player.sprite.animation_finished
	finished = true

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity += player.get_gravity() * delta
