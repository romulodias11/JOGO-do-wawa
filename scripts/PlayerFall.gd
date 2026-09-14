class_name PlayerFall
extends State

func enter(_msg: Dictionary = {}) -> void:
	player.play_animation("fall")

func physics_update(delta: float) -> void:
	var direction: float = Input.get_axis("move_left", "move_right")

	player.velocity.x = direction * player.air_speed
	if direction != 0.0:
		player.sprite.flip_h = direction < 0.0

	player.velocity += player.get_gravity() * delta
	player.move_and_slide()

	if player.is_on_floor():
		if direction == 0.0:
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
