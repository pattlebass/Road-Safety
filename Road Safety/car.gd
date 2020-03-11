extends KinematicBody

var speed = 5
var velocity = Vector3(0, 0, -1)
onready var player = get_parent().get_node("player")
var despawnable = true
var lifetime = 0

func _physics_process(delta):
	move_and_collide(velocity * speed * delta)
	if translation.x >= 40:
		translation.x = -48
	if translation.x >= 25:
		speed = 2

	if $RayCast.is_colliding():
		if !$RayCast.get_collider().name == "player":
			speed = 3
	else:
		speed = 5

func _process(delta):
	if !get_parent().game_over:
		if player.translation.distance_to(translation) > 50 && despawnable:
			queue_free()
		if !despawnable:
			lifetime += delta
			if lifetime >= 10:
				queue_free()
