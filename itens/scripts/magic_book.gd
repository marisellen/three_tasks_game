extends Area2D
class_name MagicBook

signal item_picked_up

var _player_ref: Character = null
@export_category("Variables")
@export var sickle_position: Vector2
@export var sickle_scene: PackedScene = preload("res://itens/scenes/sickle.tscn")


func _on_body_entered(body: Node2D) -> void:
	print("tocou")
	if body is Character:
		_player_ref = body
		
	connect("body_entered", Callable(self, "_on_body_entered"))
	
	if GameState.items4_collected.get("Skin_item", false):
		body.pick_item("Skin_item")
		print("Todos os itens foram coletados.")
		pick_up()
	else:
		print("Ainda faltam itens a serem coletados.")

func pick_up() -> void:
	if sickle_scene:
		var sickle_instance = sickle_scene.instantiate()
		sickle_instance.position = position + sickle_position
		get_parent().add_child(sickle_instance)
	else:
		print("Erro: sickle_scene não está definido.")
