extends Spatial

var game_over = false
var car_scene = preload("res://car.tscn")

func _ready():
	randomize()

func looped():
	$road2.visible = false
	if !game_over && randi() % 1 == 0:
		$road2.visible = true
		var car = car_scene.instance()
		car.rotation_degrees.y = 90
		car.translation = Vector3(0, 0.2, 15)
		add_child(car)
		
func spawn_car():
	var car = car_scene.instance()
	car.velocity = Vector3(1, 0, 0)
	car.speed = 5
	car.translation = Vector3($player.translation.x + 20, 0.2, rand_range(-1.5, 1.5))
	add_child(car)


func _on_Timer_timeout():
	if !game_over:
		spawn_car()
