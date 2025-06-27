@tool
extends "res://actors/player-states/Move.gd"

func _state_enter(_info: Dictionary) -> void:
	host.play_animation("Duck")
	host.ducking_collision_shape.set_deferred('disabled', false)
	host.standing_collision_shape.set_deferred('disabled', true)

func _state_exit() -> void:
	host.ducking_collision_shape.set_deferred('disabled', true)
	host.standing_collision_shape.set_deferred('disabled', false)

func _state_physics_process(delta: float) -> void:
	_check_pickup_or_throw_or_use()
	
	var input_vector = _get_player_input_vector()
	do_flip_sprite(input_vector)
	
	_decelerate_to_zero(delta)
	
	if not host.input_buffer.is_action_pressed("down") or not host.is_on_floor():
		get_parent().change_state("Idle")
	elif host.input_buffer.is_action_just_pressed("jump"):
		# Allow player to jump through one-way platform:
		host.position.y += 1
