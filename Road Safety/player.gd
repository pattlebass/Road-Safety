extends KinematicBody

onready var camera = get_parent().get_node("Camera")
var car_rigid_scene = preload("res://car_rigid.tscn")
var velocity = Vector3()
var speed = 10
var turn = 4

signal looped

func _ready():
	
	#Connect signal
	connect("looped", get_parent(), "looped")

func _physics_process(delta):
	
	#Teleport
	if translation.x >= 40:
		translation.x = -48
		emit_signal("looped")
	
	#Camera
	if speed != 0:
		camera.translation.x = translation.x - 1.5
	
	#Controls
	velocity.z = 0
	velocity.x = speed
	if Input.is_action_pressed("left") && translation.z > -1.5:
		velocity.z = -turn
	if Input.is_action_pressed("right") && translation.z < 1.5:
		velocity.z = turn
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().spawn_car()
	if Input.is_action_pressed("turbo"):
		speed = 20
	else:
		speed = 10
	move_and_slide(velocity)
	
	for ray in $rays.get_children():
		if !get_parent().game_over && ray.is_colliding() :
			get_parent().game_over = true
			var collider = ray.get_collider()
			
			#Replace player with rigid
			var car_rigid = car_rigid_scene.instance()
			car_rigid.translation = translation
			get_parent().add_child(car_rigid)
			car_rigid.apply_central_impulse(Vector3(5, 0, 0))
			#Replace collider with rigid
			collider.get_node("CollisionShape").disabled = true
			var car_rigid2 = car_rigid_scene.instance()
			car_rigid2.translation = collider.translation
			car_rigid2.rotation_degrees = collider.rotation_degrees
			get_parent().add_child(car_rigid2)
			
			print(collider.translation)
			collider.queue_free()
			queue_free()
