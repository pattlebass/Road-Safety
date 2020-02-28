extends Spatial


func _ready():
	randomize()

func looped():
	$road2.visible = false
	if randi() % 3 == 0:
		$road2.visible = true