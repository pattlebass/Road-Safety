extends Spatial

var game_over = false
var car_scene
var score = 0
var multiplier = 1

func _ready():
	randomize()

func _process(delta):
	#Game over
	if game_over && !$game_over.visible:
		#$popups.queue_free()
		$AnimationPlayer.play("game_over")
		
	#Score
	if !game_over:
		score += delta * multiplier
		$score.text = "Score: " + str(int(score) * 10)
	
func looped():
	$road2.visible = false
	for i in get_children():
		if "car" in i.name:
			i.translation.x -= 88
	if !game_over && randi() % 3 == 0:
		car_scene = load("res://car" + str(randi()%5 + 1) + ".tscn")
		$road2.visible = true
		var car = car_scene.instance()
		car.rotation_degrees.y = 90
		car.translation = Vector3(0, 0.2, 20)
		car.despawnable = false
		add_child(car)
		
func spawn_car():
	car_scene = load("res://car" + str(randi()%5 + 1) + ".tscn")
	var car = car_scene.instance()
	car.speed = 5
	if randi() % 2 == 0:
		car.velocity = Vector3(-1, 0, 0)
		car.translation = Vector3($player.translation.x + 9, 0.2, -0.53)
		car.rotation_degrees.y = 180
	else:
		car.velocity = Vector3(1, 0, 0)
		car.translation = Vector3($player.translation.x + 9, 0.2, 0.53)
	add_child(car)


func _on_Timer_timeout():
	if !game_over && $player.translation.x < 10:
		spawn_car()


func _on_try_again_pressed():
	get_tree().change_scene("res://game.tscn")


func _on_menu_pressed():
	get_tree().change_scene("res://ui/menu.tscn")

func spawn_powerup():
	var powerup_scene = preload("res://powerup.tscn")
	var powerup = powerup_scene.instance()
	powerup.translation = Vector3($player.translation.x + 10, 0.3, rand_range(-0.9, 0.9))
	add_child(powerup)


func _on_Timer2_timeout():
	if !game_over && $player.translation.x < 20:
		spawn_powerup()
