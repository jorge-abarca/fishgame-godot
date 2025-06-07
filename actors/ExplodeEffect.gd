extends CPUParticles2D

@onready var sounds = $Sounds

func _ready():
	# Effect will play at current location, which would be wrong!
	# emitting = true
	# sounds.play("Explode")
	pass

# Provide a method to start effect:
func start():
	restart()
	emitting = true
	sounds.play("Explode")

func _on_Timer_timeout() -> void:
	queue_free()
