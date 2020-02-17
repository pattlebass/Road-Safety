extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Decline_pressed():
	queue_free()


func _on_Accept_pressed():
	queue_free()
