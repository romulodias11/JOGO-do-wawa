class_name State
extends Node

var state_machine: StateMachine
var player: PlayerController

# Chamado uma vez quando o estado começa.
func enter(_msg: Dictionary = {}) -> void:
	pass

# Chamado uma vez quando o estado termina.
func exit() -> void:
	pass

# Chamado a cada frame. Use para lógica que não depende de física.
func update(_delta: float) -> void:
	pass
