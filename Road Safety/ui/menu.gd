extends Control

func _ready():
	pass


func _on_play_pressed():
	get_tree().change_scene("res://game.tscn")


func _on_settings_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
