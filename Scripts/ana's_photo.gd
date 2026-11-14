extends Control
@onready var pic: TextureRect = $Pic
@onready var black: ColorRect = $Black
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	GlobalVars.mod_changed.connect(set_mod)

func set_mod():
	print("changed mod")
	black.modulate = Color8(0, 0, 0, int(GlobalVars.pic_modulate))
	if GlobalVars.pic_modulate <= 0:
		unblur()

func unblur():
	get_tree().current_scene.set_deferred("process_mode", Node.PROCESS_MODE_DISABLED)
	pic.visible = true
	get_parent().open_pic.emit()
	animation_player.play("unblur")
	await animation_player.animation_finished
	await get_tree().create_timer(2.0).timeout
	
	SceneLoader.load_scene("uid://du4ahm0whbvcw", 1.5)
