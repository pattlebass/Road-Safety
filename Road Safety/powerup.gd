extends Area

var powerups = ["speed", "multiplier"] 
var powerup 
onready var player = get_parent().get_node("player")

func _ready():
	randomize()
	powerup = powerups[randi() % 2]
	if powerup == "speed":
		$Sprite3D.texture = load("res://ui/game/speed.png")
	if powerup == "multiplier":
		$Sprite3D.texture = load("res://ui/game/multiplier.png")

func _on_powerup_body_entered(body):
	print(powerup)
	if body.name == "player":
		if body.get_node("powerup_timer").is_stopped():
			body.poweredup(powerup)
			queue_free()

func _process(delta):
	if !get_parent().game_over:
		if player.translation.distance_to(translation) > 50:
			queue_free()
