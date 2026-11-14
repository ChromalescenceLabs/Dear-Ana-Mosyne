extends Node2D

const MEMORIES = preload("res://Scenes/memories.tscn")
@onready var memory_cont: Node2D = $"../memoryCont"
@onready var spawning_timer: Timer = $"../Spawning Timer"

var inArea = false
var memoryAmt = 0

func _ready() -> void:
	randomize()
	spawning_timer.start()
	if not inArea:
		spawmEnemy()

func spawmEnemy():
	var memoryInstance = MEMORIES.instantiate()
	var spawn = get_children()
	var index = randi() % spawn.size()
	var memoryArea = null
	
	memory_cont.add_child(memoryInstance)
	memoryInstance.global_position = spawn[index].global_position
	memoryInstance.delete.connect(decrease_amt)
	
	for child in memoryInstance.get_children():
		if child is Area2D:
			memoryArea = child
			memoryArea.area_entered.connect(memoryEnter.bind(memoryInstance))
	memoryAmt += 1

func memoryEnter(area: Area2D, child):
	if area.name == "end":
		inArea = true
		child.queue_free()
		memoryAmt -= 1
	else:
		inArea = false

func decrease_amt():
	memoryAmt -= 1

func _on_spawning_timer_timeout() -> void:
	if memoryAmt < 5:
		spawmEnemy()
