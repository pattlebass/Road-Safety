extends KinematicBody

var speed = 5
var velocity = Vector3(0, 0, -1)
onready var player = get_parent().get_node("player")

func _physics_process(delta):
	move_and_collide(velocity * speed * delta)
	if translation.x >= 40:
		translation.x = -48
	if !get_parent().game_over:
		if player.translation.distance_to(translation) > 50:
			queue_free()
