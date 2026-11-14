extends Node
signal mod_changed
var mouse_occupied := false

var pic_modulate = 255:
	set(value):
		print("val changed")
		pic_modulate = value
		mod_changed.emit()
