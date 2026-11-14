extends Node


var duration = 0

signal loading_screen_ready

func _ready() -> void:
	var tw = create_tween().set_ignore_time_scale(true).tween_property(self, "position:y", 0, 0.5).set_ease(Tween.EASE_IN)
	await tw.finished
	get_tree().paused = true
	loading_screen_ready.emit()
	
func _on_progress_changed(_new_value: float) -> void:
	pass
		
func _on_load_finished() -> void:
	await get_tree().create_timer(duration).timeout
	var tw = create_tween().set_ignore_time_scale(true).tween_property(self, "position:y", -770, 0.5).set_ease(Tween.EASE_IN)
	await tw.finished
	get_tree().paused = false
	queue_free()
