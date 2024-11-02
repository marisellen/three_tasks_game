extends Area2D
class_name WoodSoil

signal item_picked_up

var _player_ref: Character = null
@export_category("Variables")
@export var soil_position: Vector2
@export var wood_soil_scene: PackedScene = preload("res://itens/scenes/wood_soil_cene.tscn")


func _on_body_entered(body: Node2D) -> void:
	print("tocou")
	if body is Character:
		_player_ref = body
		
		GameState.connect("item_picked_up", Callable(self, "_on_item_picked_up"))
		
		if GameState.items2_collected.get("Soil", false) and GameState.items2_collected.get("Wood", false):
			body.pick_item("Soil")
			body.pick_item("Wood")
			print("Todos os itens foram coletados")
			pick_up()
		else:
			print("Ainda faltam itens a serem coletados.")

func pick_up() -> void:
	if wood_soil_scene:
		var wood_soil_instance = wood_soil_scene.instantiate()
		wood_soil_instance.position = position + soil_position
		get_parent().add_child(wood_soil_instance)
		print("Funcionou")

func _on_item_picked_up():
	print("Item coletado!")
	if GameState.items2_collected.get("Soil", false) and GameState.items2_collected.get("Wood", false):
		pick_up()


#1144, 48 (1160, 24)
