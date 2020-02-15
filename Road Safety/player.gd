extends RigidBody


func _ready():
	apply_central_impulse(Vector3(5, 0, 0))

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		pass