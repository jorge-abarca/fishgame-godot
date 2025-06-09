@tool
extends "res://actors/player-states/Idle.gd"

func _state_enter(_info: Dictionary) -> void:
	host.play_animation("Blop")
