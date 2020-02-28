extends KinematicBody

var speed = 300
var velocity = Vector3(0, 0, -1)

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	move_and_slide(velocity * speed * delta)
