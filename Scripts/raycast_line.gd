extends Line2D

func _physics_process(_delta: float) -> void:
	var laser_end_position : Vector2 = get_parent().target_position
	get_parent().force_raycast_update()
	if get_parent().is_colliding(): 
		print("is colliding
		 ")
		laser_end_position = to_local(get_parent().get_collision_point())
	set_point_position(0, laser_end_position)
