extends Node2D

var names = ["Adah", "James", "Michael", "Adam", "Richard", "John", "Nova", "Aura", "Pearl", "Billie"]
var messages = ["Wanna hang out tomorrow?", "Hey, want to go out?", "Don't forget to finish the report!", "Can you buy a loaf of bread?"]

func _ready():
	randomize()
	$name.text = names[randi() % names.size()]
	$message.text = messages[randi() % messages.size()]

func _on_OK_pressed():
	get_parent().queue_free()


func _on_See_you_soon_pressed():
	get_parent().queue_free()


func _on_Cant_talk_pressed():
	get_parent().queue_free()
