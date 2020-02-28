extends Spatial

var car_scene = preload("res://car.tscn")

func _ready():
	randomize()

func looped():
	$road2.visible = false
	if randi() % 3 == 0:
		$road2.visible = true
		var car = car_scene.instance()
		#car.rotation = Vector3(0, 90, 0)
		car.translation.y = 0.2
		add_child(car)
