extends Node2D
signal open_pic
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ana_s_photo: Control = $"Ana's Photo"

var opened := false

func _on_open_pic() -> void:
	if not opened:
		opened = true
		ana_s_photo.pic.visible = false
		animation_player.play("enter")
		await animation_player.animation_finished
		ana_s_photo.pic.visible = true
	else:
		opened = false
		ana_s_photo.pic.visible = false
		animation_player.play_backwards("enter")
		await animation_player.animation_finished
		ana_s_photo.pic.visible = true
		
