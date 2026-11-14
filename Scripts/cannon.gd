extends Node2D

var mouse_pos
var is_clicked := false
@onready var cannon_raycast: RayCast2D = $Texture/CannonRaycast
@onready var cool_down: Timer = $CoolDown
const BULLET = preload("uid://tgcfiha2l6xl")
@onready var progress_bar: TextureProgressBar = $"../ProgressBar"

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Click"): aim()
	elif event.is_action_released("Click"): unaim()
	
	if is_clicked:
		if event.is_action_pressed("Shoot") and cool_down.is_stopped():
			cool_down.start()
			progress_bar.animation_player.speed_scale = cool_down.wait_time
			progress_bar.play_anim()
			var bullet = BULLET.instantiate()
			bullet.global_position = global_position
			bullet.rotation_degrees = rotation_degrees
			bullet.rotation_num = rotation
			get_parent().add_child(bullet)
		
func _ready() -> void:
	set_process(false)

func _process(_delta: float) -> void:
	look_at_mouse()
		
func look_at_mouse() -> void:
	mouse_pos = get_local_mouse_position()
	rotation += mouse_pos.angle() * 0.1
	if (rotation_degrees > -90.0) or (rotation_degrees < -270.0):
		var rot_n = abs(rotation_degrees - -90.0)
		var rot_t = abs(rotation_degrees - -270.0)
		if rot_n > rot_t: rotation_degrees = -270
		elif rot_n < rot_t: rotation_degrees = -90

func aim() -> void:
	set_process(true)
	is_clicked = true
	cannon_raycast.modulate.a = 1

func unaim() -> void:
	set_process(false)
	is_clicked = false
	cannon_raycast.modulate.a = 0
