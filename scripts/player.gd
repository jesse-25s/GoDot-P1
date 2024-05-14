extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animationSprite = $AnimatedSprite2D

func _physics_process(delta):
	
	var axisX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if axisX > 0:
		animationSprite.animation = "Run"
		animationSprite.flip_h = false
	elif axisX < 0:
		animationSprite.animation = "Run"
		animationSprite.flip_h = true
	else:
		animationSprite.animation = "Idle"

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	var count = 0
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		animationSprite.animation = "Jump"
		velocity.y = JUMP_VELOCITY
	
	elif velocity.y < 0.0 and Input.is_action_just_pressed("ui_accept"):
		# Second Jump
		velocity.y = JUMP_VELOCITY * 0.85
	
	if	is_on_floor():
		count = 0
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
