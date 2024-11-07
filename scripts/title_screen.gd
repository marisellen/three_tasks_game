extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_start_nutton_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/sccenes/level1.tscn")

func _on_credits_nutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_quit_nutton_pressed() -> void:
	get_tree().quit()
