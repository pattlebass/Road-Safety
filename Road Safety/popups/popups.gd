extends Control

var frequency = 9999
var notif1_scene = preload("res://popups/notification1.tscn")
var call_scene = preload("res://popups/call.tscn")
var popups = {0:notif1_scene, 1:call_scene}

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func _process(delta):
	$Timer.wait_time = frequency


func _on_Timer_timeout():
	#print(randi() % popups.size())
	var current_popup = popups.get(randi() % popups.size()).instance()
	current_popup.position = Vector2(randi() % 500, randi() % 300)
	add_child(current_popup)
	
