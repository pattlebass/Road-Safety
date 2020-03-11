extends Control

func _ready():
	pass


func _on_play_pressed():
	$AnimationPlayer.play("fade_out")


func _on_exit_pressed():
	get_tree().quit()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene("res://ui/tutorial.tscn")
