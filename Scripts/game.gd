extends Node2D


func _ready() -> void:
	#var player = Context.Player.instantiate()
	#player.position = Vector2(100, 500)
	#add_child(player)
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("spawn"):
		var target = Context.Target.instantiate()
		target.position = Vector2(
			randi_range(50, get_viewport().size.x-50), 
			randi_range(50, get_viewport().size.y-50))
		add_child(target)
		
