extends Control

var ctx = Context

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_mode_pressed() -> void:
	if ctx.mode_index < len(ctx.modes)-1:
		ctx.mode_index += 1  
		#pass
	else:
		ctx.mode_index = 0
		#pass
	$VBoxContainer/Button2.text = "Mode: " + ctx.modes[ctx.mode_index]
