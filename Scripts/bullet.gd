extends CharacterBody2D

@export var speed := 500.0
var rotation_num : float = 0
var collided := false

func _ready() -> void:
	velocity = Vector2(-200, -200).normalized() * speed
	
func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation_num)
	var collision = move_and_collide(velocity * delta)
	if not collided:
		velocity = direction * speed
	if collision: 
		collided = true
		velocity = velocity.bounce(collision.get_normal())
		
