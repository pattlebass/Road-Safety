extends Control

var frequency = 3
var notif1_scene = preload("res://popups/notification1.tscn")
var call_scene = preload("res://popups/call.tscn")
var message_scene = preload("res://popups/message.tscn")
var popups = {0:notif1_scene, 1:call_scene, 2:message_scene}

func _ready():
	randomize()

func _process(delta):
	$Timer.wait_time = frequency


func _on_Timer_timeout():
	if get_children().size() < 10:
		var current_popup = popups.get(randi() % popups.size()).instance()
		current_popup.position = get_rand_position()
		add_child(current_popup)
	
func get_rand_position():
	var rand_pos = Vector2(randi() % 500, randi() % 300)

	#Check if pos overlaps with other popups

	while get_world_2d().get_direct_space_state().intersect_point(rand_pos, 32, [], 2147483647, true, true):
		rand_pos = Vector2(randi() % 500, randi() % 300)
	return rand_pos
