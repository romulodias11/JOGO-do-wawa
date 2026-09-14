class_name PlayerRun
extends State

func enter(_msg: Dictionary = {}) -> void:
	player.play_animation("run")

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Fall")
		return

	var direction: float = Input.get_axis("move_left", "move_right")

	if Input.is_action_just_pressed("attack"):
		state_machine.transition_to("Attack")
		return

	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump")
		return

	if direction == 0.0:
		state_machine.transition_to("Idle")
		return

	player.velocity.x = direction * player.speed
	player.sprite.flip_h = direction < 0.0
	player.move_and_slide()
