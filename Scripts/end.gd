extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var texture_rect: TextureRect = $TextureRect
@onready var rich_text_label: RichTextLabel = $RichTextLabel

func _ready() -> void:
	animation_player.play("unblur")
	await animation_player.animation_finished
	await get_tree().create_timer(1.0).timeout
	
	texture_rect.visible = false
	rich_text_label.visible = true
