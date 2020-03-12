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
	
	#Add exception
	for ray in $rays.get_children():
		ray.add_exception(get_parent().get_node("road"))
		ray.add_exception(get_parent().get_node("road2"))
		

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
	if Input.is_action_pressed("left") && translation.z > -1:
		velocity.z = -turn
	if Input.is_action_pressed("right") && translation.z < 1:
		velocity.z = turn
	move_and_slide(velocity)
	
	for ray in $rays.get_children():
		if !get_parent().game_over && ray.is_colliding() :
			get_parent().game_over = true
			var collider = ray.get_collider()
			
			#Replace player with rigid
			var car_rigid = car_rigid_scene.instance()
			car_rigid.translation = translation
			car_rigid.mesh = $car1.mesh
			get_parent().add_child(car_rigid)
			car_rigid.apply_central_impulse(Vector3(5, 0, 0))
			#Replace collider with rigid
			collider.get_node("CollisionShape").disabled = true
			var car_rigid2 = car_rigid_scene.instance()
			car_rigid2.translation = collider.translation
			car_rigid2.rotation_degrees = collider.rotation_degrees
			car_rigid2.mesh = collider.get_node("MeshInstance").mesh
			car_rigid2.get_node("CollisionShape").shape = collider.get_node("CollisionShape").shape
			get_parent().add_child(car_rigid2)
			
			print(collider.name)
			collider.queue_free()
			queue_free()

func _process(delta):
	if !$powerup_timer.is_stopped():
		get_parent().get_node("ProgressBar").value = $powerup_timer.time_left

func poweredup(powerup):
	if powerup == "speed":
		get_parent().multiplier = 1.5
		speed = 15
		$powerup_timer.start(8)
		$engine_audio.pitch_scale = 1.5
		get_parent().get_node("ProgressBar").max_value = 8
		get_parent().get_node("ProgressBar/Label").text = "Turbo & x1.5 Score"
	if powerup == "multiplier":
		get_parent().multiplier = 2
		$powerup_timer.start(5)
		get_parent().get_node("ProgressBar").max_value = 5
		get_parent().get_node("ProgressBar/Label").text = "x2 Score"
	get_parent().get_node("AnimationPlayer").play("powerup")


func _on_powerup_timer_timeout():
	$engine_audio.pitch_scale = 1.3
	speed = 10
	get_parent().multiplier = 1
	get_parent().get_node("AnimationPlayer").play_backwards("powerup")
