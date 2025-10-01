extends CharacterBody2D

const ACCELERATION = 50.0
const JUMP_VELOCITY = -1000.0
const GRAVITY = 980
const FRICTION = 0.93
const MAX_POWER = 2500
const MIN_POWER = 415
const CHARGE_SPEED = 50
var power: int = 0

func _ready() -> void:
	z_index = 0
	scale *= Context.Global_Scale
	$PowerBar.min_value = MIN_POWER
	$PowerBar.max_value = MAX_POWER
	$PowerBar.visible = false
	
func _process(delta: float) -> void:
	bow_arrow()
		
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += GRAVITY * delta * 4
	elif Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	#if abs(velocity.x) < 200 :
	velocity.x += direction * ACCELERATION
	velocity.x *= FRICTION

	move_and_slide()

func bow_arrow():
	$Bow.look_at(get_global_mouse_position())
	$Bow.rotation += PI
	
	if Input.is_action_pressed("shoot"):
		$PowerBar.visible = true
		#power = $Bow.position.distance_to(get_local_mouse_position())
		power += CHARGE_SPEED
		if power >= 2500: power = 2500
		$PowerBar.value = power
		$Bow.animation = "charge"
		$Bow.frame = round(remap(power, MIN_POWER, MAX_POWER, 1, 3))
		
	elif Input.is_action_just_released("shoot"):
		$Bow.animation = "charge"
		$Bow.frame = 0
		var arrow = Context.Arrow.instantiate()
		arrow.position = position
		arrow.angle = $Bow.rotation
		arrow.power = power
		get_parent().add_child(arrow)
		power = MIN_POWER
	
	else:
		$Bow.animation = "idle"
		$PowerBar.visible = false
		
