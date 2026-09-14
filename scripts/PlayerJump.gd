class_name PlayerJump
extends State

func enter(msg: Dictionary = {}) -> void:
	player.play_animation("jump")

	var impulse: float = player.jump_velocity
	if msg.has("impulse"):
		impulse = msg["impulse"]

	player.velocity.y = impulse

func physics_update(delta: float) -> void:
	var direction: float = Input.get_axis("move_left", "move_right")

	player.velocity.x = direction * player.air_speed
	if direction != 0.0:
		player.sprite.flip_h = direction < 0.0

	player.velocity += player.get_gravity() * delta
	player.move_and_slide()

	if player.velocity.y > 0.0:
		state_machine.transition_to("Fall")
