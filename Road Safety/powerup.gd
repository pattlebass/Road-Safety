extends Area

var powerups = ["speed", "multiplier"] 
var powerup 

func _ready():
	randomize()
	powerup = powerups[randi() % 2]
	

func _on_powerup_body_entered(body):
	if body.name == "player":
		if powerup == "speed":
			print("speed")
		if powerup == "multiplier":
			print("multiplier")
