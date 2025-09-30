extends CharacterBody2D

var power: float
var angle: float
const gravity: float = 980
const spawn_offset: int = 70
var collided: bool

func _ready():
	var rotated_vector = Vector2.RIGHT.rotated(angle + PI)
	position += rotated_vector * spawn_offset
	velocity = rotated_vector * power
	rotation = angle + PI
	scale *= Context.Global_Scale
	
func _process(delta: float) -> void:
	pass

func _physics_process(delta):
	if collided: queue_free()
	velocity.y += gravity * delta * 2
	velocity.x = move_toward(velocity.x, 0, velocity.x * 0.01)
	rotation = velocity.angle()

	var collision = move_and_collide(velocity * delta)
	if collision:
		collided = true
