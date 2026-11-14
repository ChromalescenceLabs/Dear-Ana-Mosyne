extends Sprite2D
@export var speed = 0.1
func _physics_process(delta: float) -> void:
	get_parent().global_position.y -= randi_range(100, 200) *delta


func _on_tree_entered() -> void:
	var random =randf_range(1, 1.3)
	modulate = Color.from_rgba8(randi_range(0, 255), randi_range(0, 255), randi_range(0, 255), 255)
	get_parent().scale = Vector2(random,random)
