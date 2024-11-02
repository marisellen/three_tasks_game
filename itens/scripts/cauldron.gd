extends Area2D
class_name Cauldron

var _player_ref: Character = null

@export var glue_scene: PackedScene
@export var items_collected : Array = []

func _on_body_entered(_body: Node2D) -> void:
	_total_items()
	print("tocou")

func _total_items() -> void:
	var all_collected = true  
	for item in items_collected:
		if not item:  
			all_collected = false
			break  
	if all_collected:
		pick_up() 
		print("Todos os itens foram coletados. Funcionou!")
	else:
		print("Ainda faltam itens a serem coletados.")
	
func pick_up() -> void:
	var glue_scene = load("res://itens/scenes/glue.tscn")
	var glue_instance = glue_scene.instantiate()
	glue_instance.position = position + Vector2(1, 10) 
	get_parent().add_child(glue_instance)
	print("item gerado")		
