extends TextureButton

func _on_pressed() -> void:
	SceneLoader.load_scene("uid://do2byq3wg0a3x", 1.5, SceneLoader.loading_screen_fade)
