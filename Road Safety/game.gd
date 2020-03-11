extends Spatial

var game_over = false
var car_scene

func _ready():
	randomize()

func looped():
	$road2.visible = false
	if !game_over && randi() % 1 == 0:
		car_scene = load("res://car" + str(randi()%5 + 1) + ".tscn")
		$road2.visible = true
		var car = car_scene.instance()
		car.rotation_degrees.y = 90
		car.translation = Vector3(0, 0.2, 15)
		add_child(car)
		
func spawn_car():
	car_scene = load("res://car" + str(randi()%5 + 1) + ".tscn")
	var car = car_scene.instance()
	car.speed = 5
	if randi() % 2 == 0:
		car.velocity = Vector3(-1, 0, 0)
		car.translation = Vector3($player.translation.x + 10, 0.2, -0.78)
		car.rotation_degrees.y = 180
	else:
		car.velocity = Vector3(1, 0, 0)
		car.translation = Vector3($player.translation.x + 10, 0.2, 0.78)
	add_child(car)


func _on_Timer_timeout():
	if !game_over && $player.translation.x < 25:
		spawn_car()
