extends CharacterBody2D


const JUMP_VELOCITY = -400.0
const ACCEL = 1600
const MAX_SPEED = 150
const FRICT = 1600
const FACE_CAMERA = Vector2.DOWN
@onready var player = $Player
var vel = Vector2.ZERO
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var IV = Vector2.ZERO
	IV.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	IV.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	IV = IV.normalized()
	if IV.x > 0:
		player.frame = 2
		player.flip_h = true
	elif IV.x < 0:
		player.frame = 2
		player.flip_h = false
	if IV.y > 0:
		player.frame = 0
		player.flip_h = false
	elif IV.y < 0:
		player.frame = 1
		player.flip_h = false

		
	vel = vel.move_toward(IV * MAX_SPEED, ACCEL * delta)
	if IV == Vector2.ZERO:
		vel = vel.move_toward(Vector2.ZERO, FRICT * delta)
	set_velocity(vel)
	move_and_slide()
	vel = vel
	move_and_slide()
	
	if Input.is_action_just_pressed("Inetract"):
		$InteractArea/CollisionShape2D.disabled = false
	if Input.is_action_just_released("Inetract"):
		$InteractArea/CollisionShape2D.disabled = true
	
