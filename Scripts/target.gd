extends RigidBody2D

var popped: bool
var scale_: Vector2

func _ready() -> void:
	add_to_group("targets")
	popped = false
	scale_ = Vector2.ONE * randf_range(0.7, 1.1)
	scale(scale_)
	mass = 15 * scale_.x
	
		
func _physics_process(delta: float) -> void:
	if not popped:
		apply_force(Vector2(0, -2500 * mass), Vector2(0, -195).rotated(rotation)) #balloon levitation

func on_body_entered(body: Node2D) -> void:
	if body.is_in_group("arrows"):
		$burst.pitch_scale = remap(scale_.x, 0.7, 1.2, 0.8, 0.4)
		$burst.play(0.1)
		$visuals/balloon.visible = false
		$balloonarea.queue_free()
		$balloonhitbox.queue_free()
		center_of_mass = Vector2(0, 0)
		popped = true

#func scale(node: Node2D, scale: Vector2):
func scale(scale: Vector2):
	$coinhitbox.apply_scale(scale)
	$balloonarea.apply_scale(scale)
	$visuals.apply_scale(scale)
	$balloonhitbox.apply_scale(scale)
	$balloonhitbox.position *= scale
