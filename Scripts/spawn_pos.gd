extends Node2D

const MEMORIES = preload("res://Scenes/memories.tscn")

@onready var memory_cont: Node2D = $"../memoryCont"
@onready var spawning_timer: Timer = $"../Spawning Timer"

var inArea = false

func _ready() -> void:
	randomize()
	spawning_timer.start()
	if not inArea:
		spawmEnemy()

func spawmEnemy():
	print("yo")
	var memoryInstance=MEMORIES.instantiate()
	var spawn = get_children()
	var index = randi() % spawn.size()
	memory_cont.add_child(memoryInstance)
	memoryInstance.global_position = spawn[index].global_position
	memoryInstance.area_entered.connect(memoryEnter.bind())
	spawning_timer.start()

func memoryEnter(area: Area2D):
	if area:
		inArea=true
		print(area.name)
	else:
		inArea=false

func _on_spawning_timer_timeout() -> void:
	spawmEnemy()
