extends Node

# Preload scenes once, globally
const Arrow = preload("res://Scenes/arrow.tscn")
const Game = preload("res://Scenes/game.tscn")
const Player = preload("res://Scenes/player.tscn")
const Target = preload("res://Scenes/target.tscn")
const Global_Scale = 1.4

var modes: Array = ["timer", "levels", "endless"]
var mode_index: int = 0
