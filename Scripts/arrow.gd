extends RigidBody2D

var power: float
var angle: float
var collided: bool = false
var last_position: Vector2 
const spawn_offset: int = 70


func _ready():
	add_to_group("arrows")
	var rotated_vector = Vector2.RIGHT.rotated(angle + PI)
	position += rotated_vector * spawn_offset
	rotation = angle + PI
	scale *= Context.Global_Scale
	apply_impulse(rotated_vector * power * 0.8, Vector2.ZERO)

func _physics_process(delta: float) -> void:
	#if position.distance_to(last_position) < 5:
		#queue_free()
			
	if linear_velocity.length() > 1:
		rotation = linear_velocity.angle()
		
	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	linear_velocity.x = move_toward(linear_velocity.x, 0, abs(linear_velocity.x) * 0.01)


func _on_body_entered(body: Node) -> void:
	if not body.is_in_group("bouncers"):
		queue_free()
		
