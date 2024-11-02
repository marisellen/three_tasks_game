extends Area2D
class_name Cauldron

var _player_ref: Character = null

@export var glue_scene: PackedScene
@export var items_collected : Array = []

func _on_body_entered(_body: Node2D) -> void:
		pick_up() 
		print("tocou")

func _total_items(items_collected)  -> void:
	if items_collected.size() == 3:	
		print("funcionou")
	
func pick_up() -> void:
	var glue_scene = load("res://itens/scenes/glue.tscn")
	var glue_instance = glue_scene.instantiate()
	glue_instance.position = position + Vector2(1, 10) 
	get_parent().add_child(glue_instance)
	print("item gerado")		
