extends Node2D
@onready var bg: Control = $BG
@onready var animation_player: AnimationPlayer = $ColorRect2/AnimationPlayer

var doneBowl = false 
var doneCustomer = false

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(preload("uid://cdatjfkbc2kt1"), "start")
	#playFade(2,1)

func changeScene(goIn, goOut):
	var bgIn = bg.get_child(goIn)
	var bgOut = bg.get_child(goOut)
	bgIn.visible=true
	bgOut.visible=false

func mainMenu():
	print("GO")
	animation_player.play("fade")
	await animation_player.animation_finished
	SceneLoader.load_scene("uid://duy3xpqtjjl7k", 1.5, SceneLoader.loading_screen_fade)
