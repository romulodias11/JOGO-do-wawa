class_name StateMachine
extends Node

@export var initial_state: State

var current_state: State
var player: PlayerController


func _ready() -> void:
	call_deferred("_initialize")


func _initialize() -> void:
	player = get_parent() as PlayerController

	if player == null:
		push_error("StateMachine precisa ser filha de um PlayerController.")
		set_process(false)
		set_physics_process(false)
		return

	for child in get_children():
		if child is State:
			var state: State = child as State
			state.state_machine = self
			state.player = player

	if initial_state == null:
		for child in get_children():
			if child is State:
				initial_state = child
				break

	if initial_state != null:
		current_state = initial_state
		current_state.enter()
		
		
		
func _process(delta: float) -> void:
	if current_state != null:
		current_state.update(delta)


func _physics_process(delta: float) -> void:
	if current_state != null:
		current_state.physics_update(delta)


func transition_to(state_name: String, msg: Dictionary = {}) -> void:
	var node: Node = get_node_or_null(state_name)

	if node == null:
		push_warning("Estado não encontrado: " + state_name)
		return

	if not node is State:
		push_warning("O nó " + state_name + " não herda de State.gd.")
		return

	var new_state: State = node as State

	if new_state == current_state:
		return

	if current_state != null:
		current_state.exit()

	current_state = new_state
	current_state.enter(msg)
