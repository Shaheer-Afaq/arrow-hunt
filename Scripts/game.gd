extends Node2D


func _ready() -> void:
	var player = Context.Player.instantiate()
	player.position = Vector2(100, 500)
	add_child(player)

func _process(delta: float) -> void:
	pass
