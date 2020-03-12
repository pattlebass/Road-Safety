extends Node2D

var names = ["Adah", "James", "Michael", "Adam", "Richard", "John", "Nova", "Aura", "Pearl", "Billie"]
var appeared 

func _ready():
	randomize()
	get_parent().get_node("AnimationPlayer").queue("vibrate")
	#Set name
	$name.text = names[randi() % names.size()]
	#Vibrate
	get_parent().get_parent().get_parent().get_node("phone").play()
	
	appeared = true

func _on_Decline_pressed():
	get_parent().get_parent().get_parent().get_node("phone").stop()
	get_parent().get_node("AnimationPlayer").play_backwards("fade_in")
	get_parent().get_node("lifetime").start()

func _on_Accept_pressed():
	get_parent().get_parent().get_parent().get_node("phone").stop()
	get_parent().get_node("AnimationPlayer").play("answer")
	get_parent().get_node("Timer").start()
	get_parent().get_node("AudioStreamPlayer").play()
	

func _on_Timer_timeout():
	get_parent().get_node("AnimationPlayer").play_backwards("fade_in")
	get_parent().get_node("lifetime").start()
	

func _on_lifetime_timeout():
	get_parent().queue_free()
