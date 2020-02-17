extends KinematicBody

onready var camera = get_parent().get_node("Camera")
var velocity = Vector3()
var speed = 200

func _ready():
	pass

func _physics_process(delta):
	#Camera
	camera.translation.x = translation.x - 2
	
	#Controls
	velocity.z = 0
	velocity.x = 1000
	if Input.is_action_pressed("left"):
		velocity.z = -speed
	if Input.is_action_pressed("right"):
		velocity.z = speed
		
	move_and_slide(velocity * delta)