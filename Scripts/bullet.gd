extends CharacterBody2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@export var speed := 500.0
var rotation_num : float = 0
var collided := false
var collisions := 0:
	set(value):
		collisions = value
		if collisions >= 6: delete()

func _ready() -> void:
	velocity = Vector2(-200, -200).normalized() * speed

func _process(delta: float) -> void:
	rotation += delta * 3.5
	
func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation_num)
	var collision = move_and_collide(velocity * delta)
	if not collided:
		velocity = direction * speed
	if collision: 
		collided = true
		collisions += 1
		velocity = velocity.bounce(collision.get_normal())
		

func delete() -> void:
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	delete()
