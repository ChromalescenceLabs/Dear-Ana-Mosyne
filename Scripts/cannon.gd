extends Node2D

var mouse_pos

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Click"): aim()
	elif event.is_action_released("Click"): unaim()
		
func _ready() -> void:
	set_process(false)
		
func _process(_delta: float) -> void:
	look_at_mouse()
		
func look_at_mouse() -> void:
	mouse_pos = get_local_mouse_position()
	rotation += mouse_pos.angle() * 0.1 	

func aim() -> void:
	set_process(true)

func unaim() -> void:
	set_process(false)
