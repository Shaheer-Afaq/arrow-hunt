extends CharacterBody2D

var popped: bool
var gravity: int
var size: float

func _ready() -> void:
	popped = false
	scale.x = randf_range(0.7, 1.2)
	scale.y = scale.x
	gravity = 0
	
func _process(delta: float) -> void:
	pass
		
func _physics_process(delta: float) -> void:
	velocity.y += gravity
	move_and_collide(velocity)
	if position.y > get_viewport().size.y + 50: queue_free()

func on_body_entered(body: Node2D) -> void:
	if body.is_in_group("arrows"):
		$burst.pitch_scale = remap(scale.x, 0.7, 1.2, 0.8, 0.4)
		$burst.play(0.1)
		$balloon.visible = false
		$balloonarea.monitoring = false
		gravity = 2

func delete_after_delay(time: float = 2.0):
	var deleteTimer = Timer.new()
	deleteTimer.wait_time = time
	deleteTimer.one_shot = true
	add_child(deleteTimer)
	deleteTimer.start()
	deleteTimer.timeout.connect(func():queue_free())
