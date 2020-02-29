extends Node2D

var names = ["Adah", "James", "Michael", "Adam", "Richard", "John", "Nova", "Aura", "Pearl", "Billie"]

func _ready():
	randomize()
	$name.text = names[randi() % names.size()]


func _on_OK_pressed():
	queue_free()


func _on_See_you_soon_pressed():
	queue_free()


func _on_Cant_talk_pressed():
	queue_free()
