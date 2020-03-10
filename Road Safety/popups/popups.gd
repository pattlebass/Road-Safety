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
	if get_children().size() <= 7:
		var current_popup = popups.get(randi() % popups.size()).instance()
		current_popup.position = get_rand_position()
		add_child(current_popup)
	
func get_rand_position():
	var rand_pos = Vector2(rand_range(100, OS.window_size.x - 100), rand_range(100, OS.window_size.y - 100))

	#Check if pos overlaps with other popups

	var tries = 0
	while get_world_2d().get_direct_space_state().intersect_point(rand_pos, 32, [], 2147483647, true, true):
		rand_pos = Vector2(rand_range(100, OS.window_size.x - 100), rand_range(100, OS.window_size.y - 100))
		tries += 1
		if tries >= 20:
			break
	rand_pos = Vector2(int(rand_pos.x), int(rand_pos.y))
	return rand_pos
