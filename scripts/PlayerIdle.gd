class_name PlayerIdle
extends State
# texte

func enter(_msg: Dictionary = {}) -> void:
	player.velocity.x = 0.0
	player.play_animation("idle")

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

	if direction != 0.0:
		state_machine.transition_to("Run")
		return

	player.move_and_slide()
