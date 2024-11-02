extends Area2D
class_name Cauldron

var _player_ref: Character = null

@export var glue_scene: PackedScene

func _on_body_entered(body: Node2D) -> void:
	print("tocou")
	if GameState.items_collected.get("MagicFlower") and GameState.items_collected.get("Water") and GameState.items_collected.get("Sap") == true:
		body.pick_item("MagicFlower")  
		body.pick_item("Water")
		body.pick_item("Sap")
		print("Todos os itens foram coletados. Funcionou!")
		pick_up()
	else:
		print("Ainda faltam itens a serem coletados.")
	
func pick_up() -> void:
	var glue_scene = load("res://itens/scenes/glue.tscn")
	var glue_instance = glue_scene.instantiate()
	glue_instance.position = position + Vector2(1, 10) 
	get_parent().add_child(glue_instance)
	print("item gerado")		
