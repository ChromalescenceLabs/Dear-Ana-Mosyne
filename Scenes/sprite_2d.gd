extends Sprite2D
@export var speed = 0.1

func _physics_process(delta: float) -> void:
	global_position.y -= randi_range(1, 5)
