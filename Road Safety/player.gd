extends KinematicBody

onready var camera = get_parent().get_node("Camera")
var car_rigid_scene = preload("res://car_rigid.tscn")
var velocity = Vector3()
var speed = 500
var turn = 200

func _ready():
	pass

func _physics_process(delta):
	#Teleport
	if translation.x >= 40:
		translation.x = -48
	#Camera
	if speed != 0:
		camera.translation.x = translation.x - 1.5
	
	#Controls
	velocity.z = 0
	velocity.x = speed
	if Input.is_action_pressed("left"):
		velocity.z = -turn
	if Input.is_action_pressed("right"):
		velocity.z = turn
	if Input.is_action_just_pressed("ui_accept"):
		var car_rigid = car_rigid_scene.instance()
		translation = car_rigid.translation
		get_parent().add_child(car_rigid)
		#car_rigid.apply_central_impulse(Vector3(200, 0, 0))
		speed = 0
		visible = false
		
	move_and_slide(velocity * delta)

