extends CPUParticles2D

func _ready():
	# Effect will play at current location, which would be wrong!
	# emitting = true
	pass

# Provide a method to start effect:
func start():
	restart()
	emitting = true

func _on_Timer_timeout() -> void:
	queue_free()
