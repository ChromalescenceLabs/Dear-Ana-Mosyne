extends TextureProgressBar
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var progress_bar: TextureProgressBar = $"."

func play_anim(): 
	progress_bar.visible = true
	animation_player.play("cooldown")
	await animation_player.animation_finished
	progress_bar.visible = false
