@tool
extends RayCast2D

@export var cast_speed := 7000.0
@export var max_length := 1400.0

func _physics_process(delta: float) -> void:
	target_position.x = move_toward(
		target_position.x,
		max_length,
		cast_speed * delta
	)

@export var is_casting := false: set = set_is_casting

func set_is_casting(new_value : bool) -> void:
	if is_casting == new_value:
		return
	is_casting = new_value
	
	set_physics_process(is_casting)
	
	if is_casting == false:
		target_position.x = 0.0
