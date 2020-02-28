extends Node2D

var names = ["Adah", "James", "Michael", "Adam", "Richard", "John", "Nova", "Aura", "Pearl", "Billie"]

func _ready():
	randomize()
	get_parent().get_node("AnimationPlayer").queue("vibrate")
	#Set name
	$name.text = names[randi() % names.size()]

func _on_Decline_pressed():
	get_parent().queue_free()

func _on_Accept_pressed():
	get_parent().queue_free()
