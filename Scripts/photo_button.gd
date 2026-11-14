extends TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Click"):
		get_parent().open_pic.emit()

func _ready() -> void:
	set_process_input(false)

func _on_mouse_entered() -> void: 
	animation_player.play("hover")
	set_process_input(true)
	GlobalVars.mouse_occupied = true

func _on_mouse_exited() -> void: 
	animation_player.play_backwards("hover")
	set_process_input(false)
	GlobalVars.mouse_occupied = false
